From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 Nov 2015 21:53:05 +0100
Subject: [Buildroot] Buildroot defconfigs now being built on Travis CI
In-Reply-To: <20151124185221.16a4b432@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 24 Nov 2015 18:52:21 +0100")
References: <20151123223332.3eff11d8@free-electrons.com>
 <874mgc4c6f.fsf@dell.be.48ers.dk>
 <20151124185221.16a4b432@free-electrons.com>
Message-ID: <87d1uz15n2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

>> Is that XFS issue something we want to fix before 2015.11?

 > I don't think we can fix it before 2015.11. The hack I've done in
 > Travis is just what it is: a crude hack. The underlying problem is that
 > we ask the host filesystem how many blocks are needed to store
 > output/target/. It works fine if your host filesystem == target
 > filesystem == ext2/3/4. And it probably works for most target
 > filesystems, by chance. But it is clearly not correct, since the
 > filesystem on your host may be different than the one used on your
 > target.

 > Specifically, XFS stores small files and symlinks directly inside the
 > inode instead of allocating a block for them. So the number of blocks
 > needed to store output/target on the host is much smaller than what is
 > needed on the target ext2 filesystem.

Ok :/


 >> What is that
 >> stupidpid thing about? Does travis stop if it doesn't get any output?

 > Travis is somewhat annoying in his handling of logs:

 >  * Originally, I was just calling "make", so Travis was seeing the
 >    entire make output. But Travis doesn't like to have more than 4 MB
 >    of text displayed on the standard output, so it was killing the
 >    builds when they reached 4 MB.

 >  * So, I pipped the output into tee to keep the log, and then grep to
 >    only show the ">>>" messages on stdout. But then, Travis is not
 >    happy because stdout is sometimes quiet for "too long".

 > So, I ended up starting a stupid background process that just says
 > "Still building" every minute. A bit silly, but works.

Gaah, silly - But ok, if it works..


 >> I see that results are copied to the autobuilder server? How are they
 >> visualized? Just together with the other autobuild results?

 > Right now they are not publicly available. However, they are indeed on
 > the machine that hosts autobuild.buildroot.org, so it's just a matter
 > of doing a bit of webserver configuration to provide access to them. My
 > plan is to add a message at the end of the build that tells the URL at
 > which the full log has been saved.

 > However, the logs are quite big, so I don't think I will be able to
 > keep them forever (just like I don't keep the full logs of the random
 > tests on autobuild.b.o, I only keep build-end.log).

 > Isn't the last 1000 lines of log already displayed in the Travis
 > console sufficient to debug most problems anyway?

Probably it is, I just saw that you were copying them to the
autobuilders.

Thanks!

-- 
Venlig hilsen,
Peter Korsgaard 
