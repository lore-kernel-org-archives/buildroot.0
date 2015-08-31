From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Aug 2015 14:48:28 +0200
Subject: [Buildroot] [PATCH 0/6] [RFC] Adds test infrastructure for
 packages
In-Reply-To: <1441015151-3108-1-git-send-email-denis.thulin@openwide.fr>
References: <1441015151-3108-1-git-send-email-denis.thulin@openwide.fr>
Message-ID: <20150831144828.59f18355@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Denis,

On Mon, 31 Aug 2015 11:59:05 +0200, Denis THULIN wrote:
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
> 
> This patch series is intented as a solution for that problem.

Thanks a lot for working on the topic of runtime testing, which is an
important topic that needs to be addressed in the Buildroot community.

However, I have to say I personally dislike quite a bit some of the
principles of your solutions:

 * I don't like the Robot Framework. It requires you to learn another
   new, specialized (and weird) language to write tests, instead of
   simply writing them in Python. The Robot Framework is probably good
   when the people who will write the tests are not developers. But
   that's not the case of Buildroot users and developers. Many of them
   probably already know Python (or at least the basics of it), while
   nobody knows this specialized language. It will be a barrier to
   getting tests written by Buildroot contributors.

 * I don't think tying tests to packages is the correct idea. Some
   tests need to be done for filesystem formats, some tests for core
   mechanisms (like checking BR2_EXTERNAL functionality, checking core
   package infrastructure mechanisms, etc.). I don't think the test
   mechanism should modify Buildroot itself.

Also, this may be me not understanding properly, but I fail to see
where are your test cases. My impression is that you add tests to
packages, and then your idea is that whenever a package is enabled in a
given configuration, you will run the tests of this package. But who
will generate the configurations to be tested? They surely cannot be
randomly generated, because many combinations of packages do not make
sense (for example a random configuration that has Dropbear and OpenSSH
enabled will build fine, but will completely fail at runtime because
both will try to bind on port 22).

I certainly do not claim that my proposal at
https://github.com/tpetazzoni/buildroot-runtime-test was ideal and
perfect, but it is IMO much more in-line with what we need for
Buildroot: fully written in a language that is generally well-known,
and a simple list of test-cases that associate a configuration to be
built/executed with a set of actions to be verified.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
