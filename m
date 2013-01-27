From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 27 Jan 2013 12:36:58 +0100
Subject: [Buildroot] rebuilding a project on older commits
In-Reply-To: <20130127113309.4623b949@skate> (Thomas Petazzoni's message of
 "Sun, 27 Jan 2013 11:33:09 +0100")
References: <51041908.1030803@googlemail.com> <20130127093035.5537b93f@skate>
 <5104EF52.3010608@googlemail.com> <20130127113309.4623b949@skate>
Message-ID: <877gmydfhh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Is it possible to move this existing toolchain outside buildroot or
 >> should I rebuild from scratch?

 Thomas> You should build it once with Crosstool-NG outside of Buildroot,
 Thomas> install it somewhere, and tell Buildroot to use it as an external
 Thomas> toolchain.

Building it inside Buildroot should also work (E.G. just set
BR2_HOST_DIR to some/place/elsewhere and use that directory as your
external toolchain dir).

 >> For the first two points I can answer with yes, but your tip with the
 >> /lib folder is the right one. This folder is empty, and this also in
 >> the output/target directory so it must be empty in the rootfs.tar too.
 >> 
 >> So the libraries in the /lib folder are missing there must be
 >> something wrong with the config of the ct-ng? Any suggestions where I
 >> have to look to?

 Thomas> That sounds really odd. Maybe we have a bug in the ct-ng
 Thomas> backend, and it doesn't copy the libraries? I would have to do
 Thomas> a test build, but I'm on the battery in the train for now, so I
 Thomas> can't do heavy builds for now.

It sounds like this:

commit de1eb105a45f88d8c6bf0e00f9b878a36114a5c1
Author: Floris Bos <bos@je-eigen-domein.nl>
Date:   Sat Jan 5 19:11:45 2013 +0000

    Fix installation of crosstool-ng libraries to target
    
    When using the crosstool-ng toolchain option, the libc libraries were not
    installed to target.  Buildroot calls the show-tuple function to determine
    the directory to copy from, and it seems that outputs the result to stderr
    instead of stdout
    
    Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
    Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
    Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

I don't quite recall when the problem was introduced, but if it's
present in 2012.11, this would certainly be a candidate for 2012.11.2.

-- 
Bye, Peter Korsgaard
