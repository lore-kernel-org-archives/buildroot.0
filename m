From: Stefan Becker <chemobejk@gmail.com>
Date: Thu, 19 Apr 2018 10:58:34 +0300
Subject: [Buildroot] [PATCH RESEND] core: enhance printvars for
 variables with newlines
In-Reply-To: <20180419074749.GB2496@scaer>
References: <CAOJ2eMdEHvZeJ6rECyRkzMZN0UYJ2CYK4yMgR9d89P%2B-tWYJYw@mail.gmail.com>
 <20180416115855.26762-1-chemobejk@gmail.com>
 <fc8f1cc6-e9ba-9cfe-df4a-4b80792d6434@mind.be>
 <20180419074749.GB2496@scaer>
Message-ID: <CAOJ2eMcpV1LnHn-sMwxU=owx-6-wKhG7Z-t95n2=zhK4Maikug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, Apr 19, 2018 at 10:47 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Compare with the non-expanded, raw value:
>
>     $ eval make -s printvars VARS=SYSTEMD_USERS QUOTED_VARS=YES RAW_VARS=YES
>     SYSTEMD_USERS=' - - input -1 * - - - Input device group
>             - - systemd-journal -1 * - - - Journal
>             - - render -1 * - - - DRI rendering nodes
>             - - kvm -1 * - - - kvm nodes
>             systemd-bus-proxy -1 systemd-bus-proxy -1 * - - - Proxy D-Bus messages to/from a bus
>             systemd-journal-gateway -1 systemd-journal-gateway -1 * /var/log/journal - - Journal Gateway
>             systemd-journal-remote -1 systemd-journal-remote -1 * /var/log/journal/remote - - Journal Remote
>             systemd-journal-upload -1 systemd-journal-upload -1 * - - - Journal Upload
>             $(SYSTEMD_COREDUMP_USER)
>             $(SYSTEMD_NETWORKD_USER)
>             $(SYSTEMD_RESOLVED_USER)
>             $(SYSTEMD_TIMESYNCD_USER)'
>
> So, newlines are still present, and we can especially see this is the
> case around the variables that are expanded to empty (the coredump,
> networkd, resolved, and timesyncd users).
>
> So, the whole excuse for the change, as explained in the commit log,
> does not stand: newlines are preserved.

Can you please explain to me how to detect reliably where the variable
content ends with QUOTED_VARS=YES? Example of variables with and
without newlines in the same output:

$ external/scripts/buildstep.sh printvars QUOTED_VARS=1
VARS="CANFESTIVAL_INSTALL_TARGET_CMDS SYSTEMD_USERS"
CANFESTIVAL_INSTALL_TARGET_CMDS='       for d in src drivers ; do
PATH="/workarea/stefanb/repos/buildroot-new/output/host/bin:/workarea/stefanb/repos/buildroot-new/output/host/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/home/stefanb/.local/bin:/home/stefanb/bin"
/usr/bin/make -j1 -C ./$d install
PYTHON=/workarea/stefanb/repos/buildroot-new/output/host/bin/python2
DESTDIR=/workarea/stefanb/repos/buildroot-new/output/target || exit 1
; done'
SYSTEMD_USERS=' - - input -1 * - - - Input device group
        - - systemd-journal -1 * - - - Journal
...
        systemd-resolve -1 systemd-resolve -1 * - - - Network Name
Resolution Manager
        systemd-timesync -1 systemd-timesync -1 * - - - Network Time
Synchronization'

$ external/scripts/buildstep.sh printvars QUOTED_VARS=1
VARS="CANFESTIVAL_INSTALL_TARGET_CMDS SYSTEMD_USERS" | wc -l
13

MULTILINE_VARS=YES adds an additional seperator that makes it possible
to reliably detect the end of the variable content.


One improvement idea would be to use the content of MULTILINE_VARS as
the separator, e.g.

.... MULTILINE_VARS=some-random-seperator-XYZ ...
START-some-random-seperator-XYZ VAR
line 1
line 2
...
END-some-random-seperator-XYZ VAR

That way you could cases where the variable content matches a fixed separator.

Regards, Stefan
