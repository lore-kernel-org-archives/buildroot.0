From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 24 Dec 2013 18:14:22 +0100
Subject: [Buildroot] [RFC] python: select vs depends on
Message-ID: <CAAXf6LWHabEdHC4V4rzVduUqxx3a9vPjiJ91yYjs9+5UQtaFQQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Currently, we have a dual strategy with respect to packages that have
optional Python support: alsa-lib uses 'depends on python' for its
'python support' option, while ola uses 'select python' for its
'python bindings'.

The alsa-lib line has been changed from 'select' to 'depends on' with
commit 45c8d2037866248818a52f0d0f7d7a6d467b016f, and description:
"As discussed on the list."

The relevant thread seems to be:
http://lists.busybox.net/pipermail/buildroot/2009-January/024938.html
where Peter says:

----
 ulf> +config BR2_PACKAGE_ALSA_LIB_PYTHON
 ulf> + bool "Python support for alsa-lib"
 ulf> + depends on BR2_PACKAGE_ALSA_LIB
 ulf> + select BR2_PACKAGE_PYTHON

It would probably be good to add a 'default BR2_PACKAGE_PYTHON' line,
so it defaults to enabled if you have python support, and false
otherwise.

Alternatively it should depend on BR2_PACKAGE_PYTHON and just be
default y, as it's probably pretty unlikely someone wants python
support in alsa without having python enabled in the first place.

The 2nd option seems cleanest to me, what do you think?
----

The reasoning makes sense, but one could also reason: if someone
enables python support in alsa, he agrees that the python package is
automatically selected.

So there are two ways to look at this, and I'd like to make a decision
on this. There are three different situations:

- python modules (typically named python-foo): here the current
strategy is to use 'depends on', and this is followed by all such
packages. For me, this is perfectly sane, and is (IMO) not open for
discussion.
Note: in fact, all these modules are in one 'if python' block in
package/Config.in, and I have prepared a patch to remove the redundant
'depends on'.

- for 'normal' packages that need python for there normal behavior, we
typically use 'select python'. In this case, the user may not be aware
of the python dependency, and requiring him/her to first enable python
is not logical. I think this reasoning is sane too.

- for 'normal' packages that do not require python, but have optional
python support (as is the case for ola and alsa-lib), I have no strong
preference. Whichever is preferred by the community is ok with me, as
long as we keep one guideline for this case.


Based on the outcome of the above discussion, I would like to update
the manual and line up the packages that do not conform.

Thanks for your input!
(and Merry Christmas)

Best regards,
Thomas
