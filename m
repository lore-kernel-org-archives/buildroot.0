From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 14 Jan 2015 00:06:15 +0100
Subject: [Buildroot] [PATCHv2 4/4] Makefile: implement a size-stats
	target
In-Reply-To: <20150113091247.56a66605@free-electrons.com>
References: <1417470100-32657-1-git-send-email-thomas.petazzoni@free-electrons.com>	<1417470100-32657-5-git-send-email-thomas.petazzoni@free-electrons.com>	<54B44F00.9060207@openwide.fr>
 <20150113091247.56a66605@free-electrons.com>
Message-ID: <54B5A4E7.9030708@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 13/01/2015 09:12, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
> 
> On Mon, 12 Jan 2015 23:47:28 +0100, Romain Naour wrote:
> 
>>> +size-stats:
>>> +	@[ -f $(O)/build/packages-file-list.txt ] || \
>>> +		{ echo "ERROR: No package size information available, please rebuild with BR2_COLLECT_FILE_SIZE_STATS" ; exit 1; }
>>> +	@$(INSTALL) -d $(O)/graphs
>>> +	@cd "$(CONFIG_DIR)"; \
>>> +	$(TOPDIR)/support/scripts/graph-size --builddir $(O) \
>>
>> graph-size -> size-stats ?
> 
> Will fix, thanks for noticing (I renamed the script late in my
> development).
> 
>> But with that fixed I get:
>> $ make O=test/xfsprogs/ size-stats
>> Traceback (most recent call last):
>>   File "/home/naourr/git/buildroot/support/scripts/size-stats", line 217, in <module>
>>     pkgdict = build_package_dict(args.builddir)
>>   File "/home/naourr/git/buildroot/support/scripts/size-stats", line 68, in build_package_dict
>>     with open(os.path.join(builddir, "build", "packages-file-list.txt")) as filelistf:
>> IOError: [Errno 2] No such file or directory: 'test/xfsprogs/build/packages-file-list.txt'
>>
>> But this file exist:
>> $ ls test/xfsprogs/build/packages-file-list.txt
>> test/xfsprogs/build/packages-file-list.txt
> 
> Might be that I didn't properly take into account out-of-tree build. My
> bad, I'll have a look.

The problem is that the size-stats script is called from CONFIG_DIR
I removed this line "@cd "$(CONFIG_DIR)"; \" and I get this graph (see attached
file).

> 
>> Also I noticed that the man pages (and headers) 
>> are taken into account in packages-file-list.txt:
>> [...]
>> tmux,./usr/bin/tmux
>> tmux,./usr/share/man/man1/tmux.1
>>
>> Since they are removed at the end, I think we want to 
>> remove them from packages-file-list.txt during
>> TARGET_DIR cleanup ?
> 
> It does not really matter if there are more files in
> packages-file-list.txt that there really are in TARGET_DIR, because the
> logic of the size-stats script is to travel through TARGET_DIR, and for
> each file in TARGET_DIR, lookup in packages-file-list.txt which package
> was the last one to install this file. So all files that are in
> packages-file-list.txt but not in TARGET_DIR are purely and simply
> ignored.

Ok, I haven't reviewed the size-stats script yet.
Thank for the explanation.

Best regards,
Romain
> 
> Thanks for your review and testing!
> 
> Thomas
> 

-------------- next part --------------
A non-text attachment was scrubbed...
Name: graph-size.pdf
Type: application/pdf
Size: 18491 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150114/e0d04737/attachment.pdf>
