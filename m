From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 25 Apr 2019 15:39:48 -0500
Subject: [Buildroot] [PATCH 1/1] support/testing: openjdk JNI test cases
In-Reply-To: <20190425194045.27849-1-dleach@belcan.com>
References: <20190425194045.27849-1-dleach@belcan.com>
Message-ID: <CANQCQpb05+D-_ZwNvtVQePCBytxmwz0N-rmN5hEvhT3u1YhXEg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 25, 2019 at 2:38 PM Daniel J. Leach
<daniel.j.leach@gmail.com> wrote:
>
> This test case builds a native library and ensures a Java class can load
> and interact with the native library. The test also verifies Java code
> can make system calls via the native library.
>

Acked-by: Matthew Weber <matthew.weber@rockwellcollins.com>

> Signed-off-by: Daniel J. Leach <dleach@belcan.com>
> ---
>  .../package/br2-external/openjdk/Config.in    |  1 +
>  .../package/openjdk-jni-test/Config.in        |  5 +
>  .../package/openjdk-jni-test/JniHelper.java   |  9 ++
>  .../package/openjdk-jni-test/JniTest.java     | 92 ++++++++++++++++++
>  .../package/openjdk-jni-test/JniWrapper.c     | 50 ++++++++++
>  .../package/openjdk-jni-test/JniWrapper.java  | 17 ++++
>  .../package/openjdk-jni-test/jni_helper.c     | 94 +++++++++++++++++++
>  .../package/openjdk-jni-test/jni_helper.h     | 13 +++
>  .../openjdk/package/openjdk-jni-test/native.c | 39 ++++++++
>  .../openjdk/package/openjdk-jni-test/native.h | 11 +++
>  .../openjdk-jni-test/openjdk-jni-test.mk      | 34 +++++++
>  support/testing/tests/package/test_openjdk.py |  6 ++
>  12 files changed, 371 insertions(+)
>  create mode 100644 support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/Config.in
>  create mode 100644 support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/JniHelper.java
>  create mode 100644 support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/JniTest.java
>  create mode 100644 support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/JniWrapper.c
>  create mode 100644 support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/JniWrapper.java
>  create mode 100644 support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/jni_helper.c
>  create mode 100644 support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/jni_helper.h
>  create mode 100644 support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/native.c
>  create mode 100644 support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/native.h
>  create mode 100644 support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/openjdk-jni-test.mk
>
> diff --git a/support/testing/tests/package/br2-external/openjdk/Config.in b/support/testing/tests/package/br2-external/openjdk/Config.in
> index 00c7fd4799..2588b34054 100644
> --- a/support/testing/tests/package/br2-external/openjdk/Config.in
> +++ b/support/testing/tests/package/br2-external/openjdk/Config.in
> @@ -1 +1,2 @@
>  source "$BR2_EXTERNAL_OPENJDK_PATH/package/openjdk-hello-world/Config.in"
> +source "$BR2_EXTERNAL_OPENJDK_PATH/package/openjdk-jni-test/Config.in"
> diff --git a/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/Config.in b/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/Config.in
> new file mode 100644
> index 0000000000..22cd0c0aab
> --- /dev/null
> +++ b/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_OPENJDK_JNI_TEST
> +       bool "openjdk JNI test"
> +       depends on BR2_PACKAGE_OPENJDK
> +       help
> +         Tests openjdk JNI support
> diff --git a/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/JniHelper.java b/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/JniHelper.java
> new file mode 100644
> index 0000000000..9e2a0387eb
> --- /dev/null
> +++ b/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/JniHelper.java
> @@ -0,0 +1,9 @@
> +public class JniHelper
> +{
> +       public void HelloManagedWorld()
> +       {
> +               stringMember = "Hello, Managed World";
> +       }
> +
> +       public String stringMember = "Set from Java";
> +}
> diff --git a/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/JniTest.java b/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/JniTest.java
> new file mode 100644
> index 0000000000..3d6c17b746
> --- /dev/null
> +++ b/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/JniTest.java
> @@ -0,0 +1,92 @@
> +public class JniTest
> +{
> +       private static void Test(
> +               String name,
> +               Object actual,
> +               Object expected,
> +               String actualAsString,
> +               String expectedAsString)
> +       {
> +               if (!actual.equals(expected))
> +               {
> +                       System.out.println(String.format(
> +                               "Test: %s failed\nExpected: \"%s\", Actual: \"%s\"",
> +                               name,
> +                               expected,
> +                               actual));
> +                       JniTest.exitCode = -1;
> +               }
> +               else
> +               {
> +                       System.out.println(String.format("Test: %s passed", name));
> +               }
> +       }
> +
> +       private static void Test(
> +               String name,
> +               String actual,
> +               String expected)
> +       {
> +               JniTest.Test(name, actual, expected, actual, expected);
> +       }
> +
> +       public static void main(String[] args)
> +       {
> +               var actualVersion = JniWrapper.get_jni_version();
> +               var expectedVersion = 0x000A0000;
> +               JniTest.Test(
> +                       "Get JNI Version",
> +                       actualVersion,
> +                       expectedVersion,
> +                       String.format("0x%08X", actualVersion),
> +                       String.format("0x%08X", expectedVersion));
> +
> +               JniTest.Test(
> +                       "Read Native String Constant",
> +                       JniWrapper.read_constant_string(),
> +                       "Hello from C");
> +
> +               JniTest.Test(
> +                       "Write Java String to Native Library",
> +                       JniWrapper.write_string("Hello from Java"),
> +                       "Hello from Java");
> +
> +               JniTest.Test(
> +                       "Write Java Char Array to Native Library",
> +                       JniWrapper.write_char_array("Hello from Java".toCharArray()),
> +                       "Hello from Java");
> +
> +               var helper = new JniHelper();
> +               JniTest.Test(
> +                       "Write String Member to Native Library",
> +                       JniWrapper.write_string_member(helper),
> +                       "Set from Java");
> +
> +               JniWrapper.set_string_member(helper);
> +               JniTest.Test(
> +                       "Set String Member from Native Library",
> +                       helper.stringMember,
> +                       "Set from C");
> +
> +               JniWrapper.execute_java_function(helper);
> +               JniTest.Test(
> +                       "Execeute Java Function from Native Library",
> +                       helper.stringMember,
> +                       "Hello, Managed World");
> +
> +               helper = JniWrapper.instantiate_java_class();
> +               JniTest.Test(
> +                       "Instantiate Java Class",
> +                       helper.stringMember,
> +                       "Instantiated from C");
> +
> +               JniTest.Test(
> +                       "Call Native Library to Set System Time",
> +                       JniWrapper.set_and_write_time_in_seconds(1000),
> +                       "1000");
> +
> +               System.exit(exitCode);
> +       }
> +
> +       public static int exitCode = 0;
> +}
> diff --git a/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/JniWrapper.c b/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/JniWrapper.c
> new file mode 100644
> index 0000000000..0dde4e0c28
> --- /dev/null
> +++ b/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/JniWrapper.c
> @@ -0,0 +1,50 @@
> +#include "JniWrapper.h"
> +#include "jni_helper.h"
> +
> +// Proxies the generated function calls to the jni_helper
> +
> +JNIEXPORT jint JNICALL Java_JniWrapper_get_1jni_1version
> +       (JNIEnv* env, jclass class)
> +{
> +       return get_jni_version(env);
> +}
> +JNIEXPORT jstring JNICALL Java_JniWrapper_read_1constant_1string
> +       (JNIEnv* env, jclass class)
> +{
> +       return read_constant_jstring(env);
> +}
> +JNIEXPORT jstring JNICALL Java_JniWrapper_write_1string
> +       (JNIEnv* env, jclass class, jstring string)
> +{
> +       return write_jstring(env, string);
> +}
> +JNIEXPORT jstring JNICALL Java_JniWrapper_write_1char_1array
> +       (JNIEnv* env, jclass class, jcharArray chars)
> +{
> +       return write_jchar_array(env, chars);
> +}
> +JNIEXPORT jstring JNICALL Java_JniWrapper_write_1string_1member
> +       (JNIEnv* env, jclass class, jobject helper)
> +{
> +       return write_string_member(env, helper);
> +}
> +JNIEXPORT void JNICALL Java_JniWrapper_set_1string_1member
> +       (JNIEnv* env, jclass class, jobject helper)
> +{
> +       set_string_member(env, helper);
> +}
> +JNIEXPORT void JNICALL Java_JniWrapper_execute_1java_1function
> +       (JNIEnv* env, jclass class, jobject helper)
> +{
> +       execute_java_function(env, helper);
> +}
> +JNIEXPORT jobject JNICALL Java_JniWrapper_instantiate_1java_1class
> +       (JNIEnv* env, jclass class)
> +{
> +       return instantiate_java_class(env);
> +}
> +JNIEXPORT jstring JNICALL Java_JniWrapper_set_1and_1write_1time_1in_1seconds
> +       (JNIEnv* env, jclass class, jint seconds)
> +{
> +       return set_and_write_time_in_seconds(env, seconds);
> +}
> diff --git a/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/JniWrapper.java b/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/JniWrapper.java
> new file mode 100644
> index 0000000000..d11e99bf01
> --- /dev/null
> +++ b/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/JniWrapper.java
> @@ -0,0 +1,17 @@
> +public class JniWrapper
> +{
> +       static
> +       {
> +               System.loadLibrary("jni_native");
> +       }
> +
> +       public static native int get_jni_version();
> +       public static native String read_constant_string();
> +       public static native String write_string(String string);
> +       public static native String write_char_array(char[] string);
> +       public static native String write_string_member(JniHelper helper);
> +       public static native void set_string_member(JniHelper helper);
> +       public static native void execute_java_function(JniHelper helper);
> +       public static native JniHelper instantiate_java_class();
> +       public static native String set_and_write_time_in_seconds(int seconds);
> +}
> diff --git a/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/jni_helper.c b/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/jni_helper.c
> new file mode 100644
> index 0000000000..e6e2eec8be
> --- /dev/null
> +++ b/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/jni_helper.c
> @@ -0,0 +1,94 @@
> +#include "jni_helper.h"
> +#include "native.h"
> +
> +// Handles Java/C interop
> +
> +jint get_jni_version(JNIEnv* env)
> +{
> +       return (*env)->GetVersion(env);
> +}
> +jstring read_constant_jstring(JNIEnv* env)
> +{
> +       return (*env)->NewStringUTF(env, read_constant_string());
> +}
> +static jstring read_internal_string_as_jstring(JNIEnv* env)
> +{
> +       return (*env)->NewStringUTF(env, read_internal_string());
> +}
> +jstring write_jstring(JNIEnv* env, jstring string)
> +{
> +       const char* utf8_string = (*env)->GetStringUTFChars(env, string, NULL);
> +       write_internal_string(utf8_string);
> +
> +       (*env)->ReleaseStringUTFChars(env, string, utf8_string);
> +       return read_internal_string_as_jstring(env);
> +}
> +jstring write_jchar_array(JNIEnv* env, jcharArray chars)
> +{
> +       jsize length = (*env)->GetArrayLength(env, chars);
> +       jchar* body = (*env)->GetCharArrayElements(env, chars, NULL);
> +       jstring input = (*env)->NewString(env, body, length);
> +       jstring output = write_jstring(env, input);
> +
> +       (*env)->ReleaseCharArrayElements(env, chars, body, JNI_ABORT);
> +       return output;
> +}
> +static jfieldID get_string_member_field(JNIEnv* env, jobject helper)
> +{
> +       jclass class = (*env)->GetObjectClass(env, helper);
> +       return (*env)->GetFieldID(env, class, "stringMember", "Ljava/lang/String;");
> +}
> +jstring write_string_member(JNIEnv* env, jobject helper)
> +{
> +       jfieldID fieldID = get_string_member_field(env, helper);
> +       jstring string = (*env)->GetObjectField(env, helper, fieldID);
> +
> +       return write_jstring(env, string);
> +}
> +static void set_string_member_helper(JNIEnv* env, jobject helper, const char* utf8_string)
> +{
> +       jfieldID fieldID = get_string_member_field(env, helper);
> +       jstring string = (*env)->NewStringUTF(env, utf8_string);
> +       (*env)->SetObjectField(env, helper, fieldID, string);
> +}
> +void set_string_member(JNIEnv* env, jobject helper)
> +{
> +       char stringBuffer[256];
> +       write_external_string(stringBuffer, 256);
> +       set_string_member_helper(env, helper, stringBuffer);
> +}
> +
> +typedef struct
> +{
> +       JNIEnv* env;
> +       jobject object;
> +       jmethodID methodID;
> +} method_parameters;
> +static void call_void_java_method(void* context)
> +{
> +       method_parameters* parameters = (method_parameters*)context;
> +       (*parameters->env)->CallVoidMethod(parameters->env, parameters->object, parameters->methodID);
> +}
> +void execute_java_function(JNIEnv* env, jobject helper)
> +{
> +       jclass class = (*env)->GetObjectClass(env, helper);
> +       jmethodID methodID = (*env)->GetMethodID(env, class, "HelloManagedWorld", "()V");
> +
> +       method_parameters parameters = {env, helper, methodID};
> +       execute_function(call_void_java_method, (void*)&parameters);
> +}
> +jobject instantiate_java_class(JNIEnv* env)
> +{
> +       jclass class = (*env)->FindClass(env, "JniHelper");
> +       jmethodID methodID = (*env)->GetMethodID(env, class, "<init>", "()V");
> +
> +       jobject object =(*env)->NewObject(env, class, methodID);
> +       set_string_member_helper(env, object, "Instantiated from C");
> +       return object;
> +}
> +jstring set_and_write_time_in_seconds(JNIEnv* env, jint seconds)
> +{
> +       set_time_in_seconds((int)seconds);
> +       write_internal_time_in_seconds();
> +       return read_internal_string_as_jstring(env);
> +}
> diff --git a/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/jni_helper.h b/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/jni_helper.h
> new file mode 100644
> index 0000000000..4c9aab3b7f
> --- /dev/null
> +++ b/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/jni_helper.h
> @@ -0,0 +1,13 @@
> +#pragma once
> +
> +#include <jni.h>
> +
> +jint get_jni_version(JNIEnv* env);
> +jstring read_constant_jstring(JNIEnv* env);
> +jstring write_jstring(JNIEnv* env, jstring string);
> +jstring write_jchar_array(JNIEnv* env, jcharArray chars);
> +jstring write_string_member(JNIEnv* env, jobject helper);
> +void set_string_member(JNIEnv* env, jobject helper);
> +void execute_java_function(JNIEnv* env, jobject helper);
> +jobject instantiate_java_class(JNIEnv* env);
> +jstring set_and_write_time_in_seconds(JNIEnv* env, jint seconds);
> diff --git a/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/native.c b/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/native.c
> new file mode 100644
> index 0000000000..ed87e345af
> --- /dev/null
> +++ b/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/native.c
> @@ -0,0 +1,39 @@
> +#include "native.h"
> +#include <stdio.h>
> +#include <time.h>
> +
> +// Pure native functions
> +
> +#define CHAR_BUFFER_SIZE 256
> +static char buffer[CHAR_BUFFER_SIZE];
> +
> +const char* read_constant_string()
> +{
> +       return "Hello from C";
> +}
> +const char* read_internal_string()
> +{
> +       return buffer;
> +}
> +void write_internal_string(const char* string)
> +{
> +       snprintf(buffer, CHAR_BUFFER_SIZE, "%s", string);
> +}
> +void write_external_string(char* string, size_t maxLength)
> +{
> +       snprintf(string, maxLength, "Set from C");
> +}
> +void execute_function(void(*function)(void*), void* context)
> +{
> +       function(context);
> +}
> +void set_time_in_seconds(int seconds)
> +{
> +       time_t timeToSet = seconds;
> +       stime(&timeToSet);
> +}
> +void write_internal_time_in_seconds()
> +{
> +       time_t systemTime = time(NULL);
> +       snprintf(buffer, CHAR_BUFFER_SIZE, "%u", systemTime);
> +}
> diff --git a/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/native.h b/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/native.h
> new file mode 100644
> index 0000000000..a25f1779db
> --- /dev/null
> +++ b/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/native.h
> @@ -0,0 +1,11 @@
> +#pragma once
> +
> +#include <stddef.h>
> +
> +const char* read_constant_string();
> +const char* read_internal_string();
> +void write_internal_string(const char* string);
> +void write_external_string(char* string, size_t maxLength);
> +void execute_function(void(*function)(void*), void* context);
> +void set_time_in_seconds(int seconds);
> +void write_internal_time_in_seconds();
> diff --git a/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/openjdk-jni-test.mk b/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/openjdk-jni-test.mk
> new file mode 100644
> index 0000000000..f279e5cd70
> --- /dev/null
> +++ b/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/openjdk-jni-test.mk
> @@ -0,0 +1,34 @@
> +################################################################################
> +#
> +# openjdk jni test
> +#
> +################################################################################
> +
> +OPENJDK_JNI_TEST_DEPENDENCIES = openjdk
> +
> +JNI_INCLUDE_PATH = $(BUILD_DIR)/openjdk-$(OPENJDK_VERSION)/build/linux-aarch64-server-release/jdk/include
> +
> +define OPENJDK_JNI_TEST_BUILD_CMDS
> +       # Compile Java classes and generate native headers
> +       $(HOST_DIR)/bin/javac -d $(@D) -h $(@D) \
> +               $(OPENJDK_JNI_TEST_PKGDIR)/JniTest.java \
> +               $(OPENJDK_JNI_TEST_PKGDIR)/JniWrapper.java \
> +               $(OPENJDK_JNI_TEST_PKGDIR)/JniHelper.java
> +
> +       # Compile shared library
> +       $(TARGET_MAKE_ENV) $(TARGET_CC) -shared -fPIC \
> +               -I$(JNI_INCLUDE_PATH) -I$(JNI_INCLUDE_PATH)/linux -I$(@D) \
> +               -o $(@D)/libjni_native.so \
> +               $(OPENJDK_JNI_TEST_PKGDIR)/JniWrapper.c \
> +               $(OPENJDK_JNI_TEST_PKGDIR)/jni_helper.c \
> +               $(OPENJDK_JNI_TEST_PKGDIR)/native.c
> +endef
> +
> +define OPENJDK_JNI_TEST_INSTALL_TARGET_CMDS
> +       $(INSTALL) -D -m 755 $(@D)/JniTest.class $(TARGET_DIR)/usr/bin/JniTest.class
> +       $(INSTALL) -D -m 755 $(@D)/JniWrapper.class $(TARGET_DIR)/usr/bin/JniWrapper.class
> +       $(INSTALL) -D -m 755 $(@D)/JniHelper.class $(TARGET_DIR)/usr/bin/JniHelper.class
> +       $(INSTALL) -D -m 755 $(@D)/libjni_native.so $(TARGET_DIR)/usr/lib/libjni_native.so
> +endef
> +
> +$(eval $(generic-package))
> diff --git a/support/testing/tests/package/test_openjdk.py b/support/testing/tests/package/test_openjdk.py
> index 5fbb500fbd..3a1d1a9b09 100644
> --- a/support/testing/tests/package/test_openjdk.py
> +++ b/support/testing/tests/package/test_openjdk.py
> @@ -21,6 +21,7 @@ class TestOpenJdk(infra.basetest.BRTest):
>          BR2_PACKAGE_XORG7=y
>          BR2_PACKAGE_OPENJDK=y
>          BR2_PACKAGE_OPENJDK_HELLO_WORLD=y
> +        BR2_PACKAGE_OPENJDK_JNI_TEST=y
>          """
>
>      def login(self):
> @@ -40,3 +41,8 @@ class TestOpenJdk(infra.basetest.BRTest):
>          print(output)
>          self.assertEqual(exit_code, 0)
>          self.assertEqual(output, ["Hello, World"])
> +
> +        cmd = "java -cp /usr/bin JniTest"
> +        output, exit_code = self.emulator.run(cmd, 120)
> +        print(output)
> +        self.assertEqual(exit_code, 0)
> --
> 2.17.1
>


-- 

Matthew Weber | Pr. Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.
