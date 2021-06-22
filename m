From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 22 Jun 2021 01:52:26 +0000
Subject: [Buildroot] [Bug 13866] New: host-go: not supported on arm64 hosts
Message-ID: <bug-13866-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13866

            Bug ID: 13866
           Summary: host-go: not supported on arm64 hosts
           Product: buildroot
           Version: unspecified
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: christian at paral.in
                CC: buildroot at uclibc.org
  Target Milestone: ---

All Go compiler versions > 1.4.x (old) are written in Go, and require a
existing compiled Go version to use to build from source.

https://golang.org/doc/install/source#bootstrapFromSource

The process for "bootstrapping" the Go compiler in Buildroot is:

1. Compile a C/C++ cross-compiler (gcc) as the host toolchain.
2. Build go-bootstrap (which is Go 1.4.x and written in C)
3. Build go 1.16.x (written in Go) using go-bootstrap.

The problem is that step 2 - build go-bootstrap - does not work on 64-bit arm.
The Go compiler from 1.4.x is compatible with x86, x86_64, and arm (32 bit)
only.

This means that arm64 host machines will skip building Go and all go-based
packages like Docker.

Due to BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS

The best fix to this for Buildroot is to continue using go-bootstrap on x86_64
or arm32 platforms (when BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS is set).
This is the most flexible option in terms of supporting third-party toolchains
to bootstrap Go.

Support for gccgo (the Go compiler built-in to GCC 5 and greater) should be
added with a conditional flag for the Buildroot toolchain (which would set
--enable-languages=go).

If the compiler supports gccgo (toolchain sets GCCGO_SUPPORTS) flag, and
GO_BOOTSTRAP_ARCH_SUPPORTS is false, then the host-go package should use the
toolchain Gccgo to compile the Go compiler.

The toolchain gccgo would install a "go" binary into the host tree provided by
gcc. (This binary is drop-in compatible with the normal Go compiler).

The Go compiler can then be instructed to use gccgo by simply setting
$GOROOT_BOOTSTRAP to host/usr.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
