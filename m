From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 10 May 2016 16:40:18 +0000
Subject: [Buildroot] [Bug 8916] New: LDFLAGS pass to openssh
Message-ID: <bug-8916-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8916

            Bug ID: 8916
           Summary: LDFLAGS pass to openssh
           Product: buildroot
           Version: unspecified
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: yxygyxyg at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

The fail message we obtain in buildroot-compiled chroot environment:

bash-4.3# ssh
bash: /usr/bin/ssh: No such file or directory

It happens because ssh execute file does not contain proper dynamic linker way:

# readelf /tmp/usr/bin/ssh -l
...
[Requesting program interpreter:
/home/cf/e2k/mcst.rel-21-0.fs/2016-04-12/e2k-generic-linux.cross/lib64/ld-linux.so.2]
...

The proper way to dynamic linker we set with
BR2_TARGET_LDFLAGS="-Wl,-dynamic-linker,/lib/ld-linux.so.2" option in .config
file. This scheme works fine in different packages (busybox, bash ...).
In case of openssh package the option does not pass through
package/openssh/openssh.mk file:

...
OPENSSH_CONF_ENV = LD="$(TARGET_CC)" LDFLAGS="$(TARGET_CFLAGS)"
...

Here internal openssh option LDFLAGS contain only common $(TARGET_CFLAGS).
Common $(TARGET_LDFLAGS) does not pass inside openssh build system here.

If we change this line to the next:

...
OPENSSH_CONF_ENV = LD="$(TARGET_CC)" LDFLAGS="$(TARGET_CFLAGS)
$(TARGET_LDFLAGS)"
...

ssh works fine.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
