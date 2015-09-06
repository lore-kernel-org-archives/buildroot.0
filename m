From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 7 Sep 2015 00:46:27 +0200
Subject: [Buildroot] [PATCH 0/6] [RFC] Adds test infrastructure for
 packages
In-Reply-To: <1441015151-3108-1-git-send-email-denis.thulin@openwide.fr>
References: <1441015151-3108-1-git-send-email-denis.thulin@openwide.fr>
Message-ID: <55ECC243.4010307@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Denis,

On 31-08-15 11:59, Denis THULIN wrote:
> This patch series adds a test generation infrastructure for packages to
> Buildroot.
> The generated tests are robotframework tests.
> 
> While it is always necessary to test that packages are installed
> correctly and work in an intended way, Buildroot does not currently
> provide any tests of package nor any way to automate the process of
> creating tests depending on your configuration or even share tests you
> have written for packages. You have to write tests manually almost
> everytime you start a new project with buildroot. This can cost a lot
> of time.

 Just to be clear: the intention of this series is to make it possible to
include in the buildroot package a way to specify some tests to run on the host
and on the target, where the purpose of these tests is to validate that the
package has been built correctly. So it is not exactly testing the buildroot
infrastructure (like what Thomas is trying to do), and it's not really running
the tests included with the package itself (these are not built and installed),
but something in-between.


 However, as far as I can see, this patch series only solves a small part of the
problem. It basically creates and installs a bunch of .robot files, and that's
it, right? You still have to make the robot framework run on these files. And
you still have to express in the robot framework or in jenkins the dependencies
to make sure the tests are first built and then executed. Correct?


 In addition, it seems to me that the munging done by the TEST_BUILD macro has
little to offer above simply copying the .robot file from the package directory
to the test directory. But possibly I don't sufficiently understand what's going on.


 And finally, buildroot tries not to enforce any particular policy or tool on
the user. So, much as I like robot, requiring the tests to use this specific
framework is definitely a no-go (at least, if it's meant to be used by end
users). Especially since it means that a rootfs with python3 can't be tested...


 I'm not entirely sure what the way to go is. It definitely is nice to have some
kind of test description as part of the packages - I like that more than the way
Thomas did it in buildroot-runtime-test, where the buildroot tree is basically
replicated externally for the tests. But the exact location of the test files is
just a minor detail I guess.


 Bottom line: I'm not in favour of this series either. Of course, the first
patch adding python-robotframework is still relevant independently.


 Regards,
 Arnout

> 
> This patch series is intented as a solution for that problem.
> 
> Why Robotframework Tests:
> Robotframework is a widely used test automation framework that allow
> writing tests in various languages (Python, Java and even C), provides
> useful test librairies and allow writing tests in various syntaxes.
> Robotframework tests are meant to be easy to read by people whom did
> not write the tests, and that can definitly be useful.
> 
> List of patches from the series :
> * Patch 1/6 adds a test generation step before install target step.
> * Patch 2/6 adds useful keywords for testing through Telnet and Qemu
> * Patch 3/6 adds menuconfig options to ease the configuration required
>   for testing through telnet and Qemu
> * Patch 4/6 adds documentation for patches 1,2 and 3
> * Patch 5/6 adds exemple tests for package python-flask
> * patch 6/6 adds exemple tests for package python (inspired by tests
>   from https://github.com/tpetazzoni/buildroot-runtime-test)
> 
> Denis THULIN (6):
>   python-robotframework: New package
>   Adds package test infrastructure
>   tests: create variable files through kconfig
>   tests: Adds user manual entry
>   flask: Adds robotframework tests
>   python: Adds tests
> 
>  Config.in                                          |   6 +
>  Makefile                                           |   9 +-
>  docs/manual/common-usage.txt                       |   2 +
>  docs/manual/test-infrastructure.txt                | 239 +++++++++++++++++++++
>  package/Config.in                                  |   1 +
>  package/Config.in.host                             |   1 +
>  package/Makefile.in                                |   1 +
>  package/pkg-generic.mk                             |  20 +-
>  package/pkg-test.mk                                |  94 ++++++++
>  package/python-flask/python-flask.mk               |   5 +
>  .../target_test_material/target_test.robot         |  25 +++
>  package/python-robotframework/Config.in            |   9 +
>  package/python-robotframework/Config.in.host       |   8 +
>  .../python-robotframework.hash                     |   4 +
>  .../python-robotframework/python-robotframework.mk |  16 ++
>  package/python/python.mk                           |  17 ++
>  package/python/python.robot                        |  32 +++
>  tests/Config.in                                    |   8 +
>  tests/host/resource.robot                          |   7 +
>  tests/target/resource.robot                        |   1 +
>  tests/tests.mk                                     |  20 ++
>  21 files changed, 522 insertions(+), 3 deletions(-)
>  create mode 100644 docs/manual/test-infrastructure.txt
>  create mode 100644 package/pkg-test.mk
>  create mode 100644 package/python-flask/target_test_material/target_test.robot
>  create mode 100644 package/python-robotframework/Config.in
>  create mode 100644 package/python-robotframework/Config.in.host
>  create mode 100644 package/python-robotframework/python-robotframework.hash
>  create mode 100644 package/python-robotframework/python-robotframework.mk
>  create mode 100644 package/python/python.robot
>  create mode 100644 tests/Config.in
>  create mode 100644 tests/host/resource.robot
>  create mode 100644 tests/target/resource.robot
>  create mode 100644 tests/tests.mk
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
