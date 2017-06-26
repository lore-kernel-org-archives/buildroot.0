From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jun 2017 10:10:10 +0200
Subject: [Buildroot] [PATCH] openssh: fix sshd for MIPS64 n32
In-Reply-To: <20170620161519.44028-1-Vincent.Riera@imgtec.com> (Vicente
 Olivert Riera's message of "Tue, 20 Jun 2017 17:15:19 +0100")
References: <20170620161519.44028-1-Vincent.Riera@imgtec.com>
Message-ID: <87wp7zgof1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > This patch backports two patches that have been sent upstream as a pull
 > request in order to fix sshd for MIPS64 n32.

 > The first patch adds support for detecting the MIPS ABI during the
 > configure phase.

 > The second patch sets the right value to seccomp_audit_arch taking into
 > account the MIPS64 ABI.

 > Currently seccomp_audit_arch is set to AUDIT_ARCH_MIPS64 or
 > AUDIT_ARCH_MIPSEL64 (depending on the endinness) when openssh is built
 > for MIPS64. However, that's only valid for n64 ABI. The right macros for
 > n32 ABI defined in seccomp.h are AUDIT_ARCH_MIPS64N32 and
 > AUDIT_ARCH_MIPSEL64N32, for big and little endian respectively.

 > Because of that an sshd built for MIPS64 n32 rejects connection attempts
 > and the output of strace reveals that the problem is related to seccomp
 > audit:

 > [pid   194] prctl(PR_SET_SECCOMP, SECCOMP_MODE_FILTER, {len=57,
 > filter=0x555d5da0}) = 0
 > [pid   194] write(7, "\0\0\0]\0\0\0\5\0\0\0Ulist_hostkey_types: "..., 97) = ?
 > [pid   193] <... poll resumed> )        = 2 ([{fd=5, revents=POLLIN|POLLHUP},
 > {fd=6, revents=POLLHUP}])
 > [pid   194] +++ killed by SIGSYS +++

 > Pull request: https://github.com/openssh/openssh-portable/pull/71

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
