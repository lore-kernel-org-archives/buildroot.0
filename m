From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Jul 2020 07:58:23 +0200
Subject: [Buildroot] [PATCH 08/11] package/pkg-generic.mk: detect files
 overwritten in TARGET_DIR and HOST_DIR
In-Reply-To: <20200724195331.GI2296@scaer> (Yann E. MORIN's message of "Fri,
 24 Jul 2020 21:53:31 +0200")
References: <20200430095249.782597-1-thomas.petazzoni@bootlin.com>
 <20200430095249.782597-9-thomas.petazzoni@bootlin.com>
 <20200501212318.GD15673@scaer> <20200724195331.GI2296@scaer>
Message-ID: <87k0ys16gw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 > Thomas, All,
 > On 2020-05-01 23:23 +0200, Yann E. MORIN spake thusly:
 >> On 2020-04-30 11:52 +0200, Thomas Petazzoni spake thusly:
 > [--SNIP--]
 >> > +ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
 >> > +# $(1): base directory to search in
 >> > +# $(2): suffix of file (optional)
 >> > +define pkg_detect_overwrite_before
 >> > +	cd $(1); \
 >> > +	LC_ALL=C find . -type f -exec md5sum {} \; > $($(PKG)_DIR)/.files$(2).md5

 > Note that this is very slow: it spawns a new md5sum process for each
 > file it encounters.

 > There is a better solution, though:

 >     find $(1) -type f -print0 |xargs -0 md5sum > $($(PKG)_DIR)/.files$(2).md5

And perhaps add -r / --no-run-if-empty to xargs for good measure, even
if it is unlikely to be completely empty.

 > Your original code took 11s (the second time, with a hot VFS cache),
 > while my proposal got it down to 2s (again, hot VFS cache).

 > We could also try to parallelise the job:

 >     find $(1) -type f -print0 |xargs -P $(PARALLEL_JOBS) -0 md5sum > $($(PKG)_DIR)/.files$(2).md5

Will that not scramble the order of the hashes in the list?

-- 
Bye, Peter Korsgaard
