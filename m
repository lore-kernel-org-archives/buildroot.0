From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Fri, 13 Jul 2012 12:08:58 -0400
Subject: [Buildroot] Systemd update
Message-ID: <CADiAo4KdxANfaB4xZyWBZe_w+y-p9UTJ1FVjcX7=KgRHkinVHQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have reached some progress with adopting systemd for Buidlroot with
proper PAM login support and working system journal.

I suggested some of my patches for upstream [1], but systemd
maintainers were not very much interested in fixes around uclibc
missing features [2], so let's keep these patches with Buildroot.

My patches and package configs are collected under this Gitorious
project [3] which is my test bench for packages being adopted for
Buildroot, and in particular under [4]. Patches are applicable to the
v186 snapshot of systemd (the latest avalable).

The patches are not 100% final at the moment I am writing this (there
are few typos I spotted and will fix them ASAP). However I am
announcing these patches for early review by the Buildroot community.

I provided some details in [1] so will not repeat them here. In
general, I am addressing the missing features at the configure.ac
level by implementing tests and setting HAVE_... flags in config.h.

The patch for getty.unit may be questionable. I need to be flexible on
what program to use as user greeter, so there is a level of
indirection added where actual getty program is symlinked to a
getty-wrapper in /sbin, and this getty-wrapper is what systemd starts.
An option to start standard busybox getty is added automatically.

As of now, I can boot a buidroot-produced image, get to the login
prompt, login with PAM, and systemd indeed places the logged-on user
session in a separate cgroup. I haven't tried whether it works with
pam_namespace though.

Few important notes (it took me some time to find out why certain
things did not work, so I am posting them here)

1. busybox should be configured with PAM support in login (under
"login utilities"), and linux-pam should be a dependency of busybox
otherwise it will not compile (PAM header files will be missing).
2. it is very important to run logged-in session in a child process
(configured sameplace, next to PAM support in login). Systemd creates
a user session and passes some pipe file descriptor to the parent
process (i. e. login). User session lives as long as that descriptor
is not closed by the parent. Busybox login, if not running logged-in
session in a child process cleans up most of it open file descriptiors
before jumping to user login shell, so new session gets killed even
before it starts ;) If using child process for logged in session,
login keeps its file descriptiors open, and the session is not killed
(it took me a lot of digging through systemd sources to trace this
down).

For now I would like to get a feedback from the Buildroot community on
this. If anybody wants to play with these additions privately please
let me know, and I'll provide more information.

Hopefully working systemd will be a useful addition to buildroot.

Thanks.

---------------------
[1] http://lists.freedesktop.org/pipermail/systemd-devel/2012-July/005920.html
[2] http://lists.freedesktop.org/pipermail/systemd-devel/2012-July/005928.htm
[3] https://gitorious.org/lfa/
[4] https://gitorious.org/lfa/myroot/trees/master/systemd-pam

-- 
Dmitry Golubovsky

Anywhere on the Web
