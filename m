From: Martin Bark <martin@barkynet.com>
Date: Tue, 17 Jul 2018 12:43:45 +0100
Subject: [Buildroot] [PATCH v6 4/4] chromium: new package
In-Reply-To: <CAMWSM7h851eMP90z27aZd0Oka_sDsvUGmZo0QRPie144zAF8yA@mail.gmail.com>
References: <20180710234212.4297-1-joseph.kogut@gmail.com>
 <20180710234212.4297-5-joseph.kogut@gmail.com>
 <CAFGQKxfwQh2UDismPjiHtdnPQO4j7D_R-jxYcs1epkg6CVwtRw@mail.gmail.com>
 <CAMWSM7guNAObwAvHG2T0R+J-w6nzYm2_YE=5QZG8S_G-btwWyA@mail.gmail.com>
 <CAFGQKxcnEgQpp+jHfR+fqiUSS6NgfqZ-wx-qow8iVvpmrmsSUg@mail.gmail.com>
 <CAMWSM7h851eMP90z27aZd0Oka_sDsvUGmZo0QRPie144zAF8yA@mail.gmail.com>
Message-ID: <CAFGQKxfh88M951NY2r=GNd7ZcLn8xiQeEqJiiCOowYt=eP+pZw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joseph,

On 16 July 2018 at 17:29, Joseph Kogut <joseph.kogut@gmail.com> wrote:
> Martin,
>
> On Sun, Jul 15, 2018 at 2:54 PM Martin Bark <martin@barkynet.com> wrote:
>>
>> Joseph,
>>
>> On 14 July 2018 at 23:57, Joseph Kogut <joseph.kogut@gmail.com> wrote:
>> > Hi Martin,
>> >
>> > On Sat, Jul 14, 2018 at 12:11 PM Martin Bark <martin@barkynet.com> wrote:
>> >>
>> > <snip>
>> >>
>> >> I tried building for an aarch64 target and it fails with the error
>> >>
>> >> ERROR at //chrome/installer/linux/BUILD.gn:413:7: Assertion failed.
>> >>       assert(false, "Linux installer not configured for this architecture.")
>> >>
>> >> Looking at chrome/installer/linux/BUILD.gn it seems only i386, x86_64,
>> >> arm, mipsel and mips64el target architectures are supported.  I think
>> >> you need to remove BR2_aarch64 and add BR2_mipsel and BR2_mips64el
>> >>
>> >
>> > Can you try adding the argument "enable_linux_installer=false" to
>> > CHROMIUM_OPTS in chromium.mk, then reconfiguring and rebuilding?
>> >
>> > I believe the "linux installer" target here is simply packaging for
>> > Debian and Fedora, which this package doesn't use.
>> >
>>
>> Thanks, that go the build further.  Now it fails with the following
>> error.  Any ideas?
>>
>>
>>
>> ERROR at //build/config/linux/pkg_config.gni:103:17: Script returned
>> non-zero exit code.
>>     pkgresult = exec_script(pkg_config_script, args, "value")
>>                 ^----------
>> Current dir: /home/br-user/buildroot/output/build/chromium-67.0.3396.79/out/Release/
>> Command: /home/br-user/buildroot/output/host/bin/python2 --
>> /home/br-user/buildroot/output/build/chromium-67.0.3396.79/build/config/linux/pkg-config.py
>> -s /home/br-user/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot
>> -a arm64 --system_libdir lib nss -v -lssl3
>> Returned 1.
>> stderr:
>>
>> Traceback (most recent call last):
>>   File "/home/br-user/buildroot/output/build/chromium-67.0.3396.79/build/config/linux/pkg-config.py",
>> line 232, in <module>
>>     sys.exit(main())
>>   File "/home/br-user/buildroot/output/build/chromium-67.0.3396.79/build/config/linux/pkg-config.py",
>> line 139, in main
>>     prefix = GetPkgConfigPrefixToStrip(options, args)
>>   File "/home/br-user/buildroot/output/build/chromium-67.0.3396.79/build/config/linux/pkg-config.py",
>> line 80, in GetPkgConfigPrefixToStrip
>>     "--variable=prefix"] + args, env=os.environ)
>>   File "/home/br-user/buildroot/output/host/lib/python2.7/subprocess.py",
>> line 216, in check_output
>>     process = Popen(stdout=PIPE, *popenargs, **kwargs)
>>   File "/home/br-user/buildroot/output/host/lib/python2.7/subprocess.py",
>> line 394, in __init__
>>     errread, errwrite)
>>   File "/home/br-user/buildroot/output/host/lib/python2.7/subprocess.py",
>> line 1047, in _execute_child
>>     raise child_exception
>> OSError: [Errno 2] No such file or directory
>>
>> See //third_party/nss/BUILD.gn:15:3: whence it was called.
>>   pkg_config("system_nss_no_ssl_config") {
>>   ^---------------------------------------
>> See //crypto/BUILD.gn:221:25: which caused the file to be included.
>>     public_configs += [ "//third_party/nss:system_nss_no_ssl_config" ]
>>                         ^-------------------------------------------
>> package/pkg-generic.mk:219: recipe for target
>> '/home/br-user/buildroot/output/build/chromium-67.0.3396.79/.stamp_configured'
>> failed
>> make: *** [/home/br-user/buildroot/output/build/chromium-67.0.3396.79/.stamp_configured]
>> Error 1
>>
>
> I think this issue, along with a few others, have since been resolved
> in my chromium-v7-wip branch, which you can find at
> https://github.com/jakogut/buildroot.

I just tried out your chromium-v7-wip branch but unfortunately i get
the exact same error.  Note i'm building inside the
buildroot/base:20180318.1724 docker container.

Also, to get the code to build i had to change select
BR2_PACKAGE_JPEG_TURBO into BR2_PACKAGE_JPEG in
package/chromium/Config.in.  I think you should also change the
CHROMIUM_DEPENDENCIES from jpeg-turbo to jpeg and let the jpeg package
pick which jpeg library to use for the target.

Thanks

Martin
