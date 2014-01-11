From: Lucas De Marchi <lucas.de.marchi@gmail.com>
Date: Sat, 11 Jan 2014 10:27:41 -0200
Subject: [Buildroot] [PATCH 3/3] pi4j: new package
In-Reply-To: <20140111144047.5370b25b@skate>
References: <1389383422-29665-1-git-send-email-lucas.de.marchi@gmail.com>
 <1389383422-29665-3-git-send-email-lucas.de.marchi@gmail.com>
 <20140111144047.5370b25b@skate>
Message-ID: <CAKi4VAKJukCe-DOS2PrDG1729NMvbFS+znV0_W65S_DkvOyB-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jan 11, 2014 at 4:40 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Lucas De Marchi,
>
> On Fri, 10 Jan 2014 17:50:22 -0200, Lucas De Marchi wrote:
>
>> Add pi4j using its released binaries. The java archives are a bit
>> different than other packages. Since they are coming already
>> pre-compiled put them in /opt with the same layout as in raspbian,
>> according to http://pi4j.com/install.html
>
> I think this is quite certainly the first Java library for which we
> have a package. Which JVM are you using to run this on the target? The
> official Oracle JDK?

I'm using the official Oracle JDK. However I think we are not allowed
to distribute it or make "recipes" to distribute it as part of
buildroot, are we? Its license looks really restrictive. My current
approach for the rootfs I'm building for a friend of mine is to
install the Oracle jdk by using a overlay directory in buildroot.  Do
you think it would be possible to add the oracle jdk to buildroot?

>
> I think this package, like Python/Lua/Perl packages, should depend on
> the selection of a JVM, be it the official Oracle JDK (for which a
> package would have to be created), or JamVM, if this package is
> actually compatible with it.
>
> Regarding the installation in /opt, I'm not sure. The fact that
> Raspbian installs it here is not that much of an argument to me (quite
> the opposite, actually!).

I put it there actually because it's a pre-compiled thing.

>
> On Ubuntu, the Java libraries are apparently installed
> in /usr/share/java/, which seems a bit more sensible to me. The JNI
> parts are installed in /usr/lib/jni/. See:
>
> $ dpkg -L librxtx-java
> [... skip documentation ...]
> /usr/share/java
> /usr/share/java/RXTXcomm-2.2pre2.jar
> /usr/share/lintian
> /usr/share/lintian/overrides
> /usr/share/lintian/overrides/librxtx-java
> /usr/lib
> /usr/lib/jni
> /usr/lib/jni/librxtxRaw-2.2pre1.so
> /usr/lib/jni/librxtxI2C-2.2pre1.so
> /usr/lib/jni/librxtxRS485-2.2pre1.so
> /usr/lib/jni/librxtxSerial-2.2pre1.so
> /usr/lib/jni/librxtxParallel-2.2pre1.so
> /usr/share/java/RXTXcomm.jar
> /usr/lib/jni/librxtxSerial.so
> /usr/lib/jni/librxtxRS485.so
> /usr/lib/jni/librxtxI2C.so
> /usr/lib/jni/librxtxParallel.so
> /usr/lib/jni/librxtxRaw.so
>
>
>> diff --git a/package/pi4j/Config.in b/package/pi4j/Config.in
>> new file mode 100644
>> index 0000000..99736bf
>> --- /dev/null
>> +++ b/package/pi4j/Config.in
>> @@ -0,0 +1,10 @@
>> +config BR2_PACKAGE_PI4J
>> +     bool "pi4j"
>> +     depends on BR2_PACKAGE_RPI_USERLAND
>
> Why this dependency?

the same as for wiringpi. This package is specific to rpi and doesn't
make sense on other platforms.

>
> As stated above, we should ensure that a JVM is selected here.
>
>> +define PI4J_INSTALL_TARGET_CMDS
>> +     $(INSTALL) -D -m 0644 $(@D)/lib/pi4j-core.jar \
>> +             $(TARGET_DIR)/opt/pi4j/lib/pi4j-core.jar
>> +     $(INSTALL) -D -m 0644 $(@D)/lib/pi4j-device.jar \
>> +             $(TARGET_DIR)/opt/pi4j/lib/pi4j-device.jar
>> +     $(INSTALL) -D -m 0644 $(@D)/lib/pi4j-example.jar \
>> +             $(TARGET_DIR)/opt/pi4j/lib/pi4j-example.jar
>> +     $(INSTALL) -D -m 0644 $(@D)/lib/pi4j-gpio-extension.jar \
>> +             $(TARGET_DIR)/opt/pi4j/lib/pi4j-extension.jar
>> +     $(INSTALL) -D -m 0644 $(@D)/lib/pi4j-service.jar \
>> +             $(TARGET_DIR)/opt/pi4j/lib/pi4j-service.jar
>> +endef
>
> This can probably be improved a little bit:
>
> PI4J_LIBS = core device example extension service
>
> define PI4J_INSTALL_TARGET_CMDS
>         $(foreach lib,$(PI4J_LIBS),\
>                 $(INSTALL) -D -m 0644 $(@D)/lib/pi4j-$(lib).jar $(TARGET_DIR)/opt/pi4j/lib/pi4j-$(lib).jar)
> endef
>
> Thanks!

ok, thanks.

Lucas De Marchi
