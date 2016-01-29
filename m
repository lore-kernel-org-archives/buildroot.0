From: Jeff Gray <jeff.gray@sato-global.com>
Date: Fri, 29 Jan 2016 11:08:53 +1100
Subject: [Buildroot] host-python link fails due to missing readline
Message-ID: <CAHb0ztk2fbycwTbct4gESVMVHuM==GaJsCVe1uVQiHVL5U84tA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Host machine : Ubuntu 12.04.2 x86_64
Buildroot : 2015.11.1
Target : arm920t
Build fail : host-python-2.7.10

Build stopped with an error during host-python:
Failed to build these modules:
readline

I can see that readline-6.3 has been built for target, but not host. In the
log file, I see these references to not finding readline as expected in the
host-python configuration stage:
checking how to link readline libs... none
checking for rl_callback_handler_install in -lreadline... no
checking for rl_pre_input_hook in -lreadline... no
checking for rl_completion_display_matches_hook in -lreadline... no
checking for rl_completion_matches in -lreadline... no

And then later in the build process, because readline is not there:
running build_ext
/usr/lib/libreadline.so: not an ELF file.

Then when trying to build the readline Python extension (shortened for
readability):
building 'readline' extension
/usr/bin/gcc ... -c /output/build/host-python-2.7.10/Modules/readline.c ...
(some warnings but nothing serious)
/usr/bin/gcc -pthread -shared readline.o ... -lreadline -lncurses
-lpython2.7 -o readline.so
/usr/bin/ld: skipping incompatible
/usr/lib/gcc/x86_64-linux-gnu/4.6/../../../../lib/libreadline.so when
searching for -lreadline
/usr/bin/ld: skipping incompatible /usr/lib/../lib/libreadline.so when
searching for -lreadline
/usr/bin/ld: skipping incompatible
/usr/lib/gcc/x86_64-linux-gnu/4.6/../../../libreadline.so when searching
for -lreadline
/usr/bin/ld: skipping incompatible /usr/lib/libreadline.so when searching
for -lreadline
/usr/bin/ld: cannot find -lreadline
collect2: ld returned 1 exit status

There is no /output/host/usr/lib/gcc/x86_64/ directory. Should there be one?

I'm experienced with embedded development, but new to buildroot, so forgive
me an obvious error. I have searched through the list archives for similar
issues, but can't find anything since a similar problem that was reported
fixed by a Python update (the patch which is no longer part of buildroot).
http://lists.busybox.net/pipermail/buildroot/2014-April/094460.html

I'm not sure what area to look at for this issue. Should readline be built
for host before the host-python build? Or is it a config error in
host-python looking for something that isn't there?

My .config file is on Google Drive here: https://goo.gl/gLj4rM
My full build log file (16MB) is here: https://goo.gl/NLDCOj
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160129/e44ab257/attachment.html>
