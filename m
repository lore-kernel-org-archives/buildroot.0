From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 8 Feb 2017 10:50:13 +0100
Subject: [Buildroot] [PATCH 1/5] support/testing: core testing
	infrastructure
In-Reply-To: <1486467363-19881-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1486467363-19881-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1486467363-19881-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LXnRWvi3i0B2q1r_gRjgTkyNjXhdSasMLyYiFrr3=RTWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 7, 2017 at 12:35 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> This commit adds the core of a new testing infrastructure that allows to
> perform runtime testing of Buildroot generated systems. This
> infrastructure uses the Python unittest logic as its foundation.
>
> This core infrastructure commit includes the following aspects:
>
>  - A base test class, called BRTest, defined in
>    support/testing/infra/basetest.py. This base test class inherited
>    from the Python provided unittest.TestCase, and must be subclassed by
>    all Buildroot test cases.
>
>    Its main purpose is to provide the Python unittest setUp() and
>    tearDown() methods. In our case, setUp() takes care of building the
>    Buildroot system described in the test case, and instantiate the
>    Emulator object in case runtime testing is needed. The tearDown()
>    method simply cleans things up (stop the emulator, remove the output
>    directory).
>
>  - A Builder class, defined in support/testing/infra/builder.py, simply
>    responsible for building the Buildroot system in each test case.
>
>  - An Emulator class, defined in support/testing/infra/emulator.py,
>    responsible for running the generated system under Qemu, allowing
>    each test case to run arbitrary commands inside the emulated system.
>
>  - A run-tests script, which is the entry point to start the tests.
>
> Even though I wrote the original version of this small infrastructure, a
> huge amount of rework and improvement has been done by Maxime
> Hadjinlian, and squashed into this patch. So many thanks to Maxime for
> cleaning up and improving my Python code!
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  support/testing/conf/unittest.cfg |   6 ++
>  support/testing/infra/__init__.py |  61 ++++++++++++++++
>  support/testing/infra/basetest.py |  66 +++++++++++++++++
>  support/testing/infra/builder.py  |  50 +++++++++++++
>  support/testing/infra/emulator.py | 144 ++++++++++++++++++++++++++++++++++++++
>  support/testing/run-tests         |  77 ++++++++++++++++++++
>  support/testing/tests/__init__.py |   0
>  7 files changed, 404 insertions(+)
>  create mode 100644 support/testing/conf/unittest.cfg
>  create mode 100644 support/testing/infra/__init__.py
>  create mode 100644 support/testing/infra/basetest.py
>  create mode 100644 support/testing/infra/builder.py
>  create mode 100644 support/testing/infra/emulator.py
>  create mode 100755 support/testing/run-tests
>  create mode 100644 support/testing/tests/__init__.py
>

Is there a particular reason why you use unittest and nose2, rather
than the popular pytest ?
