From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 14 Mar 2012 12:11:21 +0100
Subject: [Buildroot] [PATCH 1/2] Add (Freescale) elftosb host package
In-Reply-To: <20120314104146.0e75b488@skate>
References: <1331643131-31435-1-git-send-email-eric.jarrige@armadeus.org>
 <1331643131-31435-2-git-send-email-eric.jarrige@armadeus.org>
 <201203140105.44719.arnout@mind.be> <20120314104146.0e75b488@skate>
Message-ID: <4F607CD9.2080300@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
> Hello,
>
> Le Wed, 14 Mar 2012 01:05:44 +0100,
> Arnout Vandecappelle<arnout@mind.be>  a ?crit :
>
>> On Tuesday 13 March 2012 13:52:10 Eric Jarrige wrote:
>>> +define HOST_ELFTOSB_CLEAN_CMDS
>>> +       rm -rf $(@D)/bld/linux
>>> +       rm -f $(HOST_DIR)/usr/bin/elftosb
>>> +       rm -f $(HOST_DIR)/usr/bin/keygen
>>> +       rm -f $(HOST_DIR)/usr/bin/sbtool
>>> +endef
>>   These look like UNINSTALL commands, not CLEAN commands.
> Ah right. Actually the first line should be part of CLEAN commands, and
> the three last lines should be part of the UNINSTALL commands.
>
> Are they people who actually care about those CLEAN and UNINSTALL
> commands? Is it worth keeping support for them?

IIRC these targets cannot in general work correctly with the Buildroot
structure, and making them work would require a massive change, with a
big increase in complexity.

Moreover, many packages do not implement the CLEAN and UNINSTALL targets:

$ git grep -l GENTARGETS package/|grep -E '^package/[a-z]'|wc -l
111
$ git grep -l GENTARGETS package/|grep -E '^package/[a-z]'| \
     xargs grep -l '_CLEAN_CMDS'|wc -l
51
$ git grep -l GENTARGETS package/|grep -E '^package/[a-z]'| \
     xargs grep -l '_UNINSTALL_.*_CMDS'|wc -l
73

meaning that probably they are not so interesting to everybody out there.

As for me, I have never been relying on them. I prefer to distclean and
rebuild when necessary. It's reliable, and not that painful with a
reasonably recent build machine and ccache enabled.

So, my vote for dropping them.
(Or should there be a specific thread for this topic?)

Luca
