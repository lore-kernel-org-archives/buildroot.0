From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sat, 13 Jan 2018 15:54:44 -0600
Subject: [Buildroot] [PATCH] iputils: fix ping and traceroute6
 executable permissions
In-Reply-To: <1515874782-14986-1-git-send-email-tolvupostur@gmail.com>
References: <1515874782-14986-1-git-send-email-tolvupostur@gmail.com>
Message-ID: <CANQCQpYOku9_1AZtk9Qw=j=wMw2PKb=8hS0=dCvsZfbeR29e7Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Einar,

On Sat, Jan 13, 2018 at 2:19 PM,  <tolvupostur@gmail.com> wrote:
> From: Einar Jon Gunnarsson <tolvupostur@gmail.com>
>
> The iputils executables are installed without the setuid bit set,
> which prevents some programs from working.
>

Does your use case involve a system with non-root users?

Could you describe what you mean by "some programs"?

The landscape of how ping gets elevated privileges for raw socket
access has a number of options (setuid / cap_net_raw capability / new
socket type).   The backwards compatible fix would be to use setuid
but from a security hardening aspect, I wish we could set capabilities
for this instead.  The issue I see is the filesystem type dependency
so we can pre-set the capabilities in xattribs.   I'll have to ask
around if setuid vs capabilities has come up before but as most
buildroot systems run as root, I'm guessing it hasn't been a hot
topic.

Some backstory on Ubuntu's situation, I believe as of 16.04 they still
did setuid but have selectively transitioned to not.
https://bugs.launchpad.net/ubuntu/+source/iputils/+bug/534341

> +define IPUTILS_PERMISSIONS
> +       /bin/ping        f 4755 0 0 - - - - -
> +       /bin/traceroute6 f 4755 0 0 - - - - -
> +endef

The package installs other binaries when IPUTILS_INSTALL_TARGET_CMDS
executes, did you confirm that none of the others also require it?

Matt
