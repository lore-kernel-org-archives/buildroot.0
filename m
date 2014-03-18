From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 18 Mar 2014 16:53:17 +0100
Subject: [Buildroot] Error building Qt5Multimedia
In-Reply-To: <53285C1B.9040201@gmail.com>
References: <53269705.6060805@gmail.com>
 <CAAXf6LVoTKqC61B2fPbwp-9LQZ1ephfpEodHVfqedB7SPyn7kg@mail.gmail.com>
 <532828E8.5040405@gmail.com>
 <CAAXf6LVvo4VSgkHawfNuftrqW317QzQ8FO2c-1k33datwdpfSg@mail.gmail.com>
 <53284767.3040408@gmail.com> <53284881.1090803@gmail.com>
 <CAAXf6LUmEB2=XB=CuUnDREER139E3MiouKLMa4GAFrNvnDzJsw@mail.gmail.com>
 <53285568.7080900@gmail.com>
 <CAAXf6LX-dJFpaOkMaCg0A4PD1FphzO8xbPbLWTyLTX3xmO+ELA@mail.gmail.com>
 <53285C1B.9040201@gmail.com>
Message-ID: <CAAXf6LWEAPs-EpsHzgqJ1eiiRL+u2rssa_SM0EE5=6yQxrtbZQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marco,

On Tue, Mar 18, 2014 at 3:45 PM, Marco Trapanese
<marcotrapanese@gmail.com> wrote:
>
> Thomas,
>
>> You can go to output/build/qt5multimedia and try to re-execute the
>> command mentioned in config.log related to the gstreamer test. Maybe
>> you can debug based on that, maybe using 'strace -fo /tmp/out
>> <command>' to check what kind of files it is looking for.
>
>
>
> I issued:
>
> cd
> /home/marco/dev/buildroot/output/build/qt5multimedia-5.2.1/config.tests/gstreamer
>
> strace -fo /tmp/out /home/marco/dev/buildroot/output/host/usr/bin/qmake
> "CONFIG -= qt debug_and_release app_bundle lib_bundle"
> /home/marco/dev/buildroot/output/build/qt5multimedia-5.2.1/config.tests/gstreamer
>
> Project ERROR: gstreamer-0.10 development package not found
>
> Here the strace output:
>
> http://code.bulix.org/7oi5mj-85862
>
> I'm not so expert to understand what's happening.
>
> Unfortunately this feature is mandatory for my project.

The problem is this:

3752  stat64("/usr/local/bin/pkg-config", 0xbf8c2860) = -1 ENOENT (No
such file or directory)
3752  stat64("/usr/bin/pkg-config", 0xbf8c2860) = -1 ENOENT (No such
file or directory)
3752  stat64("/bin/pkg-config", 0xbf8c2860) = -1 ENOENT (No such file
or directory)
3752  stat64("/usr/local/games/pkg-config", 0xbf8c2860) = -1 ENOENT
(No such file or directory)
3752  stat64("/usr/games/pkg-config", 0xbf8c2860) = -1 ENOENT (No such
file or directory)
3752  write(2, "sh: 1: ", 7)            = 7
3752  write(2, "pkg-config: not found", 21) = 21
3752  write(2, "\n", 1)                 = 1
3752  dup2(10, 2)                       = 2
3752  close(10)                         = 0
3752  exit_group(127)                   = ?
3751  <... waitpid resumed> [{WIFEXITED(s) && WEXITSTATUS(s) == 127}], 0) = 3752
3751  rt_sigaction(SIGINT, {SIG_DFL, [], 0}, NULL, 8) = 0
3751  rt_sigaction(SIGQUIT, {SIG_DFL, [], 0}, NULL, 8) = 0
3751  rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
3751  --- SIGCHLD (Child exited) @ 0 (0) ---
3751  write(2, "Project ERROR: gstreamer-0.10 de"..., 60) = 60
3751  exit_group(3)

It tries to find pkg-config, but fails to do so. pkg-config is used in
the test to try and find gstreamer.
Normally, pkg-config should come from buildroot itself
(output/host/usr/bin/pkg-config) but it seems this is not happening
here.

I did the same on my machine, and it seems /usr/bin/pkg-config is
used. This is not supposed to happen.
It explains why building the same configuration on different machines
gives different results.

This is actually a bug.
Could you try following patch:

$ hg diff
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk
b/package/qt5/qt5multimedia/qt5multimedia.mk
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -25,7 +25,7 @@ QT5MULTIMEDIA_DEPENDENCIES += gst-plugin
 endif

 define QT5MULTIMEDIA_CONFIGURE_CMDS
-       (cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+       (cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
 endef

 define QT5MULTIMEDIA_BUILD_CMDS

and after applying this patch run:
make qt5multimedia-dirclean qt5multimedia

I believe this should fix the problem. The same solution should be
applied to the other qt5 packages.
Or maybe someone else thinks the problem should be fixed in a different way.
I'm adding some people to this thread so they can shed their light on it...

Best regards,
Thomas
