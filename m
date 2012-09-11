From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 11 Sep 2012 09:04:45 +0200
Subject: [Buildroot] [PATCH] pppd: fix build failures
In-Reply-To: <1347044851-24272-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Fri, 7 Sep 2012 20:07:31 +0100")
References: <1347044851-24272-1-git-send-email-spdawson@gmail.com>
Message-ID: <87fw6pyr8y.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>
 spdawson> Fix pppd build failures such as Build 8a9369fece696e012249b865708ffee533c5318a

 spdawson> http://autobuild.buildroot.net/results/8a9369fece696e012249b865708ffee533c5318a/build-end.log

 spdawson> Note that, although this is a build failure, the pppd plugin makefile is
 spdawson> such that plugin build failures are not correctly detected. Consequently,
 spdawson> the failure does not appear until the install phase, at which point the
 spdawson> following error occurs.

 spdawson> /usr/bin/install -D /home/test/test/output/build/pppd-2.4.5/pppd/plugins/rp-pppoe/rp-pppoe.so /home/test/test/output/target/usr/lib/pppd/2.4.5/rp-pppoe.so
 spdawson> /usr/bin/install: cannot stat `/home/test/test/output/build/pppd-2.4.5/pppd/plugins/rp-pppoe/rp-pppoe.so': No such file or directory
 spdawson> make: *** [/home/test/test/output/build/pppd-2.4.5/.stamp_target_installed] Error 1

Thanks, but I don't think this is the right fix. The problem is that
pppd contains copies of some of the kernel headers it uses, but not all.

The build error is because one of the headers it does have a copy of
(if_pppol2tp.h) was updated for kernel 3.5, and another kernel header
(if_pppox.h) which includes this and depends on the change is not
present in the pppd sources, causing us to use a mix of kernel and pppd
headers.

Just updating the included header might not always work, as you don't
have any guarantee that it will be compatible with any random kernel
headers (E.G. is sockaddr_in6 available?)

Mike fixed it in gentoo by simply getting rid of the included
if_pppol2tp.h copy, which makes sense to me as it has been included in
the kernel since 2.6.23 (and the fix we were carrying was for the update
in 2.6.35), so I've committed a fix doing that.

-- 
Bye, Peter Korsgaard
