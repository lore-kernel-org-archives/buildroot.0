From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Aug 2020 13:07:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-pycups: new package
In-Reply-To: <CALFsTFUeh=PjLmkpjGQYjS8QQQ38hqcakBA=TXf_Gaxsk8Qo7A@mail.gmail.com>
References: <20200824214857.4090659-1-joseph.kogut@gmail.com>
 <CALFsTFUuBM9uJKo9Gz4jx2PV3TwwuJs5gcKySrTJih21ZHyt7Q@mail.gmail.com>
 <20200825100821.49937320@windsurf.home>
 <CALFsTFUeh=PjLmkpjGQYjS8QQQ38hqcakBA=TXf_Gaxsk8Qo7A@mail.gmail.com>
Message-ID: <20200825130711.35b70f7a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 25 Aug 2020 13:55:36 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> On the other hand:
> * Differently from other packages that duplicate the "depends on",
> here we show nothing in case BR2_PACKAGE_CUPS isn't selected, so we
> should at least add a comment.

We don't always add a comment when the dependency is obvious. For
example, all python-<foo> packages don't have a comment that says
"python-<foo> needs python", because it's obvious if you want a Python
module that you need to enable Python.

> * In my opinion, even if the user knows that python-pycups needs cups,
> he wouldn't want to select it on his own and expect it to be selected
> when choosing python-pycups.
> But I agree that in some cases it's not so critical.

I think we agree that there is no clear cut line when it comes to using
"depends on" vs. "select" in this sort of situation.

What I believe is true is:

 - We want to use "select" when the dependency is non-obvious, like
   package "baz" depending on libxml2, openssl and libzorglub. We
   cannot expect the user to easily figure out those dependencies.

 - We want to use "depends on" for architecture
   dependencies/limitations, obviously.

 - We want to use "depends on" when the user has to be aware of the
   dependency, or when the dependency cannot easily be lifted. For
   example dependency on toolchain features: glibc/uclibc/musl,
   threads, etc.

For the other cases, there's no clear cut strategy. But for example
cups-filters has a "depends on BR2_PACKAGE_CUPS", with no comment about
this because we assume this is obvious. However, all other dependencies
of cups-filters are properly enabled using "select" as they are
non-obvious. Same for the hplip or gutenprint packages.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
