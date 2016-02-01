From: Ludovic Guegan <ludovic.guegan@gmail.com>
Date: Tue,  2 Feb 2016 00:30:57 +0100
Subject: [Buildroot]  [PATCH 0/8 RFC] Adding a Go package infrastructure
Message-ID: <1454369465-4804-1-git-send-email-ludovic.guegan@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

I would like to have your feedbacks about this serie of patches which
experiments with Go packages.

There are two related issues when packaging Go programs:

1. The Go community have not come up with a prefered way to package Go
applications. Here is a quick overview of the situation:
https://github.com/golang/go/wiki/PackageManagementTools

2. Often Go packages have dependencies that are not well expressed
with Buildroot packages. For example, the go program
github.com/rapidloop/rtop depends on golang.org/x/crypto/ssh but not
on golang.org/x/crypto/ssh/terminal.

In this serie of patch, I experiment with gb (http://getgb.io) a tool
from Dave Cheney which focuses on reproducable builds.

Dependencies are expressed using a macro (fetch-golang-package) to
fetch them consistently. See patches 6 to 8 for examples.

The general idea is the following: GOPATH is set to $(@D) and the
dependencies are downloaded into $(@D)/vendor.

You may wonder, why using gb? Well, I found gb easy to use and mature
enough for the task. It is an implementation detail which is invisible
to golang-package .mk files.

If the direction is correct, i will continue to experiement with mixed
package that have Go code and Makefiles.

Patch 1 to 2
  Host packages needed to fetch and build Go packages.

Patch 3
  Allow custom extraction location.

Patch 4 and 5
  Introduce a golang-package infrastructure.

Patch 6 to 8
  Examples of golang-packages, just for illustration. 


Your feedback is highly appreciated!


Regards,

Ludovic


Ludovic Guegan (8):
  package/golang: create Go 1.5 host compiler package
  package/golang-gb: create gb package to build and fetch go packages
  package/pkg-generic.mk: allow custom extract directory
  package/pkg-golang.mk: infrastructure for Go packages
  docs/manual: documents the golang-package infrastructure
  package/rtop: add rtop package in Go
  package/embd: add embd package (embedded programming framework)
  package/bolt: add bolt package (persistent key-value store)

 docs/manual/adding-packages-generic.txt |   3 +
 docs/manual/adding-packages-golang.txt  |  73 +++++++++++++++
 package/Config.in                       |   3 +
 package/Config.in.host                  |   2 +
 package/Makefile.in                     |   1 +
 package/bolt/Config.in                  |   7 ++
 package/bolt/bolt.hash                  |   1 +
 package/bolt/bolt.mk                    |  13 +++
 package/embd/Config.in                  |   8 ++
 package/embd/embd.hash                  |   1 +
 package/embd/embd.mk                    |  16 ++++
 package/golang-gb/Config.in.host        |   8 ++
 package/golang-gb/golang-gb.mk          |  30 ++++++
 package/golang/Config.in.host           |   7 ++
 package/golang/golang.hash              |   2 +
 package/golang/golang.mk                |  72 +++++++++++++++
 package/pkg-generic.mk                  |  12 ++-
 package/pkg-golang.mk                   | 156 ++++++++++++++++++++++++++++++++
 package/rtop/Config.in                  |   8 ++
 package/rtop/rtop.hash                  |   1 +
 package/rtop/rtop.mk                    |  16 ++++
 support/scripts/pkg-stats               |  11 +++
 22 files changed, 449 insertions(+), 2 deletions(-)
 create mode 100644 docs/manual/adding-packages-golang.txt
 create mode 100644 package/bolt/Config.in
 create mode 100644 package/bolt/bolt.hash
 create mode 100644 package/bolt/bolt.mk
 create mode 100644 package/embd/Config.in
 create mode 100644 package/embd/embd.hash
 create mode 100644 package/embd/embd.mk
 create mode 100644 package/golang-gb/Config.in.host
 create mode 100644 package/golang-gb/golang-gb.mk
 create mode 100644 package/golang/Config.in.host
 create mode 100644 package/golang/golang.hash
 create mode 100644 package/golang/golang.mk
 create mode 100644 package/pkg-golang.mk
 create mode 100644 package/rtop/Config.in
 create mode 100644 package/rtop/rtop.hash
 create mode 100644 package/rtop/rtop.mk

-- 
2.7.0
