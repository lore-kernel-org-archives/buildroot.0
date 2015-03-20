From: Walt Chow <wchowfoss@gmail.com>
Date: Fri, 20 Mar 2015 16:20:55 -0700
Subject: [Buildroot] openssl 1.0.2 with sed error of unknown option
Message-ID: <CAOYKon=qesv3Zrrnno5ha73DJRa5itMqmnMYEmnN58aDLsLuyg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upgrading to openssl 1.0.2, I came across a problem during configuration as
below:

Configured for linux-generic32.

/usr/bin/sed: -e expression #1, char 141: unknown option to `s' make[1]:
***

The problem comes from openssl.mk:

$(SED) "s:-O[0-9]:$(OPENSSL_CFLAGS):" $(@D)/Makefile

When it expands OPENSSL_CFLAGS, it contains content like "-rpath
/lib:/usr/lib".
With this the sed operation will fail.  To resolve this problem, I replaced
: with ! like:

$(SED) "s!-O[0-9]!$(OPENSSL_CFLAGS)!" $(@D)/Makefile
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150320/339833cb/attachment.html>
