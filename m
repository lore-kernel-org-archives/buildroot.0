From: Robert Urban <urban@unix-beratung.de>
Date: Tue, 18 May 2010 18:57:12 +0200
Subject: [Buildroot] stack protection support seems not to work?
Message-ID: <4BF2C6E8.8070702@unix-beratung.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Folks,

in my environment, which I git cloned yesterday, turning on stack protection
(BR2_USE_SSP) seems to break openssh (and probably anything else that is
compiled with it).

When trying to run ssh/scp/ssh-agent/sftp on target,  I get something like:

ssh[2842] general protection ip:804c375 sp:afa542b0 error:0 in ssh[8048000+3b000]

With some help from an expert, we traced the error, sort-of.  It's generated in
main(), very near the beginning.  Here's an excerpt from "buildroot-env/objdump
-d ssh.o":

0000040e <main>:
     40e:       8d 4c 24 04             lea    0x4(%esp),%ecx
     412:       83 e4 f0                and    $0xfffffff0,%esp
     415:       ff 71 fc                pushl  -0x4(%ecx)
     418:       55                      push   %ebp
     419:       89 e5                   mov    %esp,%ebp
     41b:       57                      push   %edi
     41c:       56                      push   %esi
     41d:       53                      push   %ebx
     41e:       51                      push   %ecx
     41f:       81 ec d8 05 00 00       sub    $0x5d8,%esp
     425:       65 8b 15 14 00 00 00    mov    %gs:0x14,%edx
     42c:       89 55 ec                mov    %edx,-0x14(%ebp)
     42f:       31 d2                   xor    %edx,%edx
     431:       8b 01                   mov    (%ecx),%eax
     433:       8b 71 04                mov    0x4(%ecx),%esi
     436:       89 85 2c fa ff ff       mov    %eax,-0x5d4(%ebp)
     43c:       e8 fc ff ff ff          call   43d <main+0x2f>
     441:       83 ec 0c                sub    $0xc,%esp
     444:       ff 36                   pushl  (%esi)

The error probably originates from the instructions at offset 425

	mov    %gs:0x14,%edx

"%gs", whatever that may be, seems uninitialized.

ARCH is i386, CPU is i586.

if anyone cares, mail me for config and/or build log.

Rob Urban
