From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 28 Sep 2017 12:14:44 +0200
Subject: [Buildroot] Package infrastructure for Go programs
Message-ID: <CA+TH9VmgHZ5xxYXeO7dzqKObsz+X=v38XhcK34tY3Fp=DjDyig@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello guys,

I was reading a thread [1] about a packaging infrastructure for Go
software and I'm interested to revive it.

The most difficult objection to overcome is the fact that we should
decompose software dependencies in the correspondent packages to be
downloadable separately, but unfortunately with go software (or in
general with any other software with fluid dependencies and package
management) this is really not possible.

Go permits to define dependencies on the form of a git repository
somewhere and this could change from a release to another. Moreover
the git repository linked by a software could have nested dependencies
that will be downloaded automatically by the go build system
recursively.
Dependencies are btw private to the software, downloaded in a nested
folder (usually called "vendor") and cannot be shared easily with
other software.

This is generally true with each software that uses a package
management infrastructure. I can't think of packaging any modern php
software in buildroot cause the intricacies of dependency management
added by composer. Using composer in php offers no easy way to share a
dependency with another php project btw.

Indeed, some buildroot software written in Go (like flannel) already
escapes [2] this rule.

So in the end, it's feasible for software with an internal package
management and download mechanism to be in buildroot or should we
leave them out and so the package infrastructure?

Thanks for your insights!


Sincerely, Angelo


[1] http://buildroot-busybox.2317881.n4.nabble.com/PATCH-0-8-RFC-Adding-a-Go-package-infrastructure-td124596.html

[2] From the build log for flannel:
github.com/coreos/flannel/Godeps/_workspace/src/golang.org/x/net/context
github.com/coreos/flannel/Godeps/_workspace/src/github.com/coreos/go-iptables/iptables
github.com/coreos/flannel/Godeps/_workspace/src/github.com/aws/aws-sdk-go/aws/awserr
github.com/coreos/flannel/Godeps/_workspace/src/github.com/vaughan0/go-ini
github.com/coreos/flannel/Godeps/_workspace/src/github.com/aws/aws-sdk-go/internal/endpoints
github.com/coreos/flannel/Godeps/_workspace/src/github.com/aws/aws-sdk-go/aws/awsutil
github.com/coreos/flannel/Godeps/_workspace/src/github.com/aws/aws-sdk-go/internal/protocol/query/queryutil
github.com/coreos/flannel/Godeps/_workspace/src/github.com/aws/aws-sdk-go/internal/protocol/xml/xmlutil
[...]
In this case flannel doesn't download anything only because the
dependencies are pre-downloaded and included in the release archive,
but this still conflict with the buildroot policies.

-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
