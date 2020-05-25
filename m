From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 25 May 2020 23:33:36 +0200
Subject: [Buildroot] [PATCH] package/qt5/qt5declarative: fix parallel
 install
In-Reply-To: <20200525232544.73a046f6@gmx.net>
References: <20200525203722.364874-1-romain.naour@gmail.com>
 <20200525232544.73a046f6@gmx.net>
Message-ID: <d0b8bdf1-5661-4ac7-b430-a03468fd99d5@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

Le 25/05/2020 ? 23:25, Peter Seiderer a ?crit?:
> Hello Romain,
> 
> On Mon, 25 May 2020 22:37:22 +0200, Romain Naour <romain.naour@gmail.com> wrote:
> 
>> While installing qt5declarative	examples on fast machine, example destination
>> directory will be installed twice, so it can break a parallel install, whereby
>> two make jobs may run concurrently, trying to install the same files or creating
>> the same directory.
>>
>> Cannot touch [...]chapter5-listproperties/app.qml: No such file or directory
>> Error copying [...]chapter2-methods/app.qml: Destination file exists
>>
>> This is due to "target" and "qml" target creating the same directory in the
>> generated Makefile:
>>
>>   install_target: first FORCE
>>           @test -d $(INSTALL_ROOT)/[...]/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/qt/examples/qml/tutorials/extending-qml/chapter2-methods || \
>>           mkdir -p $(INSTALL_ROOT)/[...]/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/qt/examples/qml/tutorials/extending-qml/chapter2-methods
>>
>>   install_qml: first FORCE
>>           @test -d $(INSTALL_ROOT)/[...]/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/qt/examples/qml/tutorials/extending-qml/chapter2-methods || \
>>           mkdir -p $(INSTALL_ROOT)/[...]/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/qt/examples/qml/tutorials/extending-qml/chapter2-methods
>>
>> Add "target" in "qml" dependency to fixes the issue:
>>
>>   install_qml: first install_target FORCE
>>
>> Fixes:
>> https://gitlab.com/buildroot.org/buildroot/-/jobs/565470221
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> Cc: Ga?l Portay <gael.portay@collabora.com>
>> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>> ---
>> Thomas, I'm not able to reproduce the issue. Can you try on your gitlab runner?
> 
> I can reproduce the issue on my local build machine, without your patch failing
> in 1-3 out of 10 runs, with your patch applied reduced to 1-2 failures out
> of 20-25 runs....

Thanks for testing.

The dependency problem seems common in qt5declarative, I probably miss some of
them.

> 
> The last failure (with your patch applied):
> 
> 	$ rm -rf host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/qt/examples/qml && rm -f build/qt5declarative-5.14.2/.stamp_staging_installed && make qt5declarative
> [...]

Can you share the complete log? I can't see the failing target.

If you have some time, feel free to improve/complete the patch :)

Best regards,
Romain

> make[3]: *** [Makefile:111: sub-quick-install_subtargets] Error 2
> make[2]: *** [Makefile:113: sub-examples-install_subtargets] Error 2
> make[1]: *** [package/pkg-generic.mk:364: /home/seiderer/Work/Buildroot/build_rpi4_update_001/build/qt5declarative-5.14.2/.stamp_target_installed] Error 2
> make: *** [Makefile:23: _all] Error 2
> 
> Regards,
> Peter
> 
>> ---
>>  .../0002-examples-fix-parallel-install.patch  | 152 ++++++++++++++++++
>>  1 file changed, 152 insertions(+)
>>  create mode 100644 package/qt5/qt5declarative/0002-examples-fix-parallel-install.patch
>>
>> diff --git a/package/qt5/qt5declarative/0002-examples-fix-parallel-install.patch b/package/qt5/qt5declarative/0002-examples-fix-parallel-install.patch
>> new file mode 100644
>> index 0000000000..c487a65dd4
>> --- /dev/null
>> +++ b/package/qt5/qt5declarative/0002-examples-fix-parallel-install.patch
>> @@ -0,0 +1,152 @@
>> +From bca3cfa3be7f4e0606ad244ae246e873dcdd910b Mon Sep 17 00:00:00 2001
>> +From: Romain Naour <romain.naour@gmail.com>
>> +Date: Mon, 25 May 2020 20:21:52 +0200
>> +Subject: [PATCH] examples: fix parallel install
>> +
>> +While installing qt5declarative	examples on fast machine, example destination
>> +directory will be installed twice, so it can break a parallel install, whereby
>> +two make jobs may run concurrently, trying to install the same files or creating
>> +the same directory.
>> +
>> +Cannot touch [...]chapter5-listproperties/app.qml: No such file or directory
>> +Error copying [...]chapter2-methods/app.qml: Destination file exists
>> +
>> +This is due to "target" and "qml" target creating the same directory in the
>> +generated Makefile:
>> +
>> +  install_target: first FORCE
>> +          @test -d $(INSTALL_ROOT)/[...]/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/qt/examples/qml/tutorials/extending-qml/chapter2-methods || \
>> +          mkdir -p $(INSTALL_ROOT)/[...]/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/qt/examples/qml/tutorials/extending-qml/chapter2-methods
>> +
>> +  install_qml: first FORCE
>> +          @test -d $(INSTALL_ROOT)/[...]/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/qt/examples/qml/tutorials/extending-qml/chapter2-methods || \
>> +          mkdir -p $(INSTALL_ROOT)/[...]/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/qt/examples/qml/tutorials/extending-qml/chapter2-methods
>> +
>> +Add "target" in "qml" dependency to fixes the issue:
>> +
>> +  install_qml: first install_target FORCE
>> +
>> +Fixes:
>> +https://gitlab.com/buildroot.org/buildroot/-/jobs/565470221
>> +
>> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> +---
>> + .../tutorials/extending-qml/chapter1-basics/chapter1-basics.pro | 1 +
>> + .../extending-qml/chapter2-methods/chapter2-methods.pro         | 1 +
>> + .../extending-qml/chapter3-bindings/chapter3-bindings.pro       | 1 +
>> + .../chapter4-customPropertyTypes.pro                            | 1 +
>> + .../chapter5-listproperties/chapter5-listproperties.pro         | 1 +
>> + .../tutorials/extending-qml/chapter6-plugins/import/import.pro  | 2 ++
>> + examples/quick/imageprovider/imageprovider.pro                  | 2 ++
>> + examples/quick/imageresponseprovider/imageresponseprovider.pro  | 2 ++
>> + tests/manual/highdpi/highdpi.pro                                | 2 ++
>> + 9 files changed, 13 insertions(+)
>> +
>> +diff --git a/examples/qml/tutorials/extending-qml/chapter1-basics/chapter1-basics.pro b/examples/qml/tutorials/extending-qml/chapter1-basics/chapter1-basics.pro
>> +index 9911e02484..8f54cbc478 100644
>> +--- a/examples/qml/tutorials/extending-qml/chapter1-basics/chapter1-basics.pro
>> ++++ b/examples/qml/tutorials/extending-qml/chapter1-basics/chapter1-basics.pro
>> +@@ -11,5 +11,6 @@ target.path = $$DESTPATH
>> + 
>> + qml.files = *.qml
>> + qml.path = $$DESTPATH
>> ++qml.depends = install_target
>> + 
>> + INSTALLS += target qml
>> +diff --git a/examples/qml/tutorials/extending-qml/chapter2-methods/chapter2-methods.pro b/examples/qml/tutorials/extending-qml/chapter2-methods/chapter2-methods.pro
>> +index 7fd850ce36..6433c333f8 100644
>> +--- a/examples/qml/tutorials/extending-qml/chapter2-methods/chapter2-methods.pro
>> ++++ b/examples/qml/tutorials/extending-qml/chapter2-methods/chapter2-methods.pro
>> +@@ -11,5 +11,6 @@ target.path = $$DESTPATH
>> + 
>> + qml.files = *.qml
>> + qml.path = $$DESTPATH
>> ++qml.depends = install_target
>> + 
>> + INSTALLS += target qml
>> +diff --git a/examples/qml/tutorials/extending-qml/chapter3-bindings/chapter3-bindings.pro b/examples/qml/tutorials/extending-qml/chapter3-bindings/chapter3-bindings.pro
>> +index 1ae83f71eb..8c7bd415d0 100644
>> +--- a/examples/qml/tutorials/extending-qml/chapter3-bindings/chapter3-bindings.pro
>> ++++ b/examples/qml/tutorials/extending-qml/chapter3-bindings/chapter3-bindings.pro
>> +@@ -11,5 +11,6 @@ target.path = $$DESTPATH
>> + 
>> + qml.files = *.qml
>> + qml.path = $$DESTPATH
>> ++qml.depends = install_target
>> + 
>> + INSTALLS += target qml
>> +diff --git a/examples/qml/tutorials/extending-qml/chapter4-customPropertyTypes/chapter4-customPropertyTypes.pro b/examples/qml/tutorials/extending-qml/chapter4-customPropertyTypes/chapter4-customPropertyTypes.pro
>> +index 12dfbd6280..75dd1aeaf3 100644
>> +--- a/examples/qml/tutorials/extending-qml/chapter4-customPropertyTypes/chapter4-customPropertyTypes.pro
>> ++++ b/examples/qml/tutorials/extending-qml/chapter4-customPropertyTypes/chapter4-customPropertyTypes.pro
>> +@@ -13,5 +13,6 @@ target.path = $$DESTPATH
>> + 
>> + qml.files = *.qml
>> + qml.path = $$DESTPATH
>> ++qml.depends = install_target
>> + 
>> + INSTALLS += target qml
>> +diff --git a/examples/qml/tutorials/extending-qml/chapter5-listproperties/chapter5-listproperties.pro b/examples/qml/tutorials/extending-qml/chapter5-listproperties/chapter5-listproperties.pro
>> +index 67d1cd35c3..676d623e2d 100644
>> +--- a/examples/qml/tutorials/extending-qml/chapter5-listproperties/chapter5-listproperties.pro
>> ++++ b/examples/qml/tutorials/extending-qml/chapter5-listproperties/chapter5-listproperties.pro
>> +@@ -13,5 +13,6 @@ target.path = $$DESTPATH
>> + 
>> + qml.files = *.qml
>> + qml.path = $$DESTPATH
>> ++qml.depends = install_target
>> + 
>> + INSTALLS += target qml
>> +diff --git a/examples/qml/tutorials/extending-qml/chapter6-plugins/import/import.pro b/examples/qml/tutorials/extending-qml/chapter6-plugins/import/import.pro
>> +index 5cf4621420..9f663f0b05 100644
>> +--- a/examples/qml/tutorials/extending-qml/chapter6-plugins/import/import.pro
>> ++++ b/examples/qml/tutorials/extending-qml/chapter6-plugins/import/import.pro
>> +@@ -18,6 +18,8 @@ DESTPATH=$$[QT_INSTALL_EXAMPLES]/qml/tutorials/extending-qml/chapter6-plugins/Ch
>> + target.path=$$DESTPATH
>> + qmldir.files=$$PWD/qmldir
>> + qmldir.path=$$DESTPATH
>> ++qmldir.depends = install_target
>> ++
>> + INSTALLS += target qmldir
>> + 
>> + CONFIG += install_ok  # Do not cargo-cult this!
>> +diff --git a/examples/quick/imageprovider/imageprovider.pro b/examples/quick/imageprovider/imageprovider.pro
>> +index e54469b0d8..a49d55d254 100644
>> +--- a/examples/quick/imageprovider/imageprovider.pro
>> ++++ b/examples/quick/imageprovider/imageprovider.pro
>> +@@ -12,6 +12,8 @@ EXAMPLE_FILES = imageprovider-example.qml
>> + target.path = $$[QT_INSTALL_EXAMPLES]/quick/imageprovider/ImageProviderCore
>> + qml.files = ImageProviderCore/qmldir
>> + qml.path = $$[QT_INSTALL_EXAMPLES]/quick/imageprovider/ImageProviderCore
>> ++qml.depends = install_target
>> ++
>> + INSTALLS = target qml
>> + 
>> + CONFIG += install_ok  # Do not cargo-cult this!
>> +diff --git a/examples/quick/imageresponseprovider/imageresponseprovider.pro b/examples/quick/imageresponseprovider/imageresponseprovider.pro
>> +index 8be4dbb658..e99a269602 100644
>> +--- a/examples/quick/imageresponseprovider/imageresponseprovider.pro
>> ++++ b/examples/quick/imageresponseprovider/imageresponseprovider.pro
>> +@@ -12,6 +12,8 @@ EXAMPLE_FILES = imageresponseprovider-example.qml
>> + target.path = $$[QT_INSTALL_EXAMPLES]/quick/imageresponseprovider/ImageResponseProviderCore
>> + qml.files = ImageResponseProviderCore/qmldir
>> + qml.path = $$[QT_INSTALL_EXAMPLES]/quick/imageresponseprovider/ImageResponseProviderCore
>> ++qml.depends = install_target
>> ++
>> + INSTALLS = target qml
>> + 
>> + CONFIG += install_ok  # Do not cargo-cult this!
>> +diff --git a/tests/manual/highdpi/highdpi.pro b/tests/manual/highdpi/highdpi.pro
>> +index a434f848ae..7a010896b3 100644
>> +--- a/tests/manual/highdpi/highdpi.pro
>> ++++ b/tests/manual/highdpi/highdpi.pro
>> +@@ -10,4 +10,6 @@ SOURCES += imageprovider.cpp
>> + target.path = $$[QT_INSTALL_EXAMPLES]/quick/imageprovider/ImageProvider
>> + qml.files = ImageProvider/qmldir
>> + qml.path = $$[QT_INSTALL_EXAMPLES]/quick/imageprovider/ImageProvider
>> ++qml.depends = install_target
>> ++
>> + INSTALLS = target qml
>> +-- 
>> +2.25.4
>> +
> 
