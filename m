From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 19 Feb 2019 23:14:33 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2019-02-14
In-Reply-To: <87d0no1w9p.fsf@paral.in>
References: <5c666398.1c69fb81.1f9f6.2db0SMTPIN_ADDED_MISSING@mx.google.com>
 <87d0no1w9p.fsf@paral.in>
Message-ID: <a1b02faf-5b05-b7fd-a311-4dc0a5bc8fd4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19/02/2019 01:01, Christian Stewart wrote:
> 
> Hi Thomas, all,
> 
> Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
>>          arm |                runc-v1.0.0-rc6 | http://autobuild.buildroot.net/results/63e9d88ae5177541be463f1e2aafec59aa410479
>>         i686 |                runc-v1.0.0-rc6 | http://autobuild.buildroot.net/results/f71ddcd17f4991a3caeaac42c81ed97bdf847718
>>          arm |                runc-v1.0.0-rc6 | http://autobuild.buildroot.net/results/64ecdb1e007106fdb05979b10b42b90591255504
>>          arm |                runc-v1.0.0-rc6 | http://autobuild.buildroot.net/results/c359954d671e338997615d3a2f3aca168a53cb91
>>
> 
> This is relating to O_TMPFILE not being available with this configuration:
> 
> libcontainer/nsenter/cloned_binary.c:206
> #ifdef HAVE_MEMFD_CREATE
> 	memfd = memfd_create(RUNC_MEMFD_COMMENT, MFD_CLOEXEC | MFD_ALLOW_SEALING);
> #else
> 	memfd = open("/tmp", O_TMPFILE | O_EXCL | O_RDWR | O_CLOEXEC, 0711);
> #endif
> 
> I'm not aware of what the best alternative to O_TMPFILE in this system
> setup would be. Do you (or anyone else) know a good solution to patch in
> here for compatibility?

 O_TMPFILE was added in Linux 3.11, memfd some time later IIRC. So depending on
BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 seems the correct approach.

 Regards,
 Arnout

> 
> Thanks,
> Christian
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
