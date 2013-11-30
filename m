From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 01 Dec 2013 00:30:01 +0100
Subject: [Buildroot] [PATCHv3 2/5] core: allow external
 Config.in/makefile code to be integrated
In-Reply-To: <20131129093815.5e0aee68@skate>
References: <1385591508-4174-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1385591508-4174-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAHXCMMKgWKz_p3ckA1999zxava2TG=SF5qLjqNh7mmygv36Zfg@mail.gmail.com>
 <20131128172357.1417a881@skate>
 <CAHXCMMJ9M2m_EU0uweQjoEba1JObQWB43NYM31SXTvMxtWQmKQ@mail.gmail.com>
 <20131128192018.61cf8fdb@skate>
 <CAHXCMM+wT7=ieH3P-xP8DdJzKBXsmADO5KC1EJrwJQK99AP8sg@mail.gmail.com>
 <20131128212148.5bd51eb8@skate> <20131128222115.GF3337@free.fr>
 <20131129093815.5e0aee68@skate>
Message-ID: <529A74F9.4070603@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi all,

  Sorry that I'm so late to join the discussion - I've been busy, and I 
felt this was something that I needed to think about a little.

On 29/11/13 09:38, Thomas Petazzoni wrote:
> Dear Yann E. MORIN,
>
> On Thu, 28 Nov 2013 23:21:15 +0100, Yann E. MORIN wrote:
>
>>> I perfectly understand what you mean, but I don't really like the idea
>>> of sourcing BR2_EXTERNAL/package/Config.in.host, because it means the
>>> user has to *always* create two Config.in files in its BR2_EXTERNAL
>>> hierarchy to just get started in using BR2_EXTERNAL.
>>>
>>> So, the reason your comment is *entirely* related to the previous
>>> discussion is that in my previous proposal, I was including *ONE*
>>> top-level BR2_EXTERNAL/Config.in, and it was up to the user to then do
>>> whatever he wanted in this top-level Config.in file. We were not
>>> enforcing anything.
>>>
>>> I was OK with enforcing the usage of BR2_EXTERNAL/package/Config.in,
>>> but not if we extend that to also enforce the usage (and existence) of
>>> BR2_EXTERNAL/package/Config.in.host.
>>
>> At first, I would have sided with Samuel on that one, since it might
>> sound a bit ugly to have host packages appear in the target packages
>> menu.
>>
>> Yes, we want to enforce the directory layout in BR2_EXTERNAL. But do we
>> want to enforce the menu structure. too?
>>
>> In the end I think Thomas is right, but for different reasons: if we
>> eventually added package/Config.in.host. then we should do the same for
>> the bootloaders, too. And probably other menus, too. Which means the
>> user would have to provide all of these files, even empty ones.
>>
>> Anyway, let's keep it simple for now. We can refine it later if needed.
>
> In other words, you're suggestion to revert back to the principle of
> the v2 in terms of .mk file and Config.in inclusion? (I.e include a
> top-level .mk file and top-level Config.in, and let the user do what he
> wants?).
>
> I personally believe this is the easiest and most flexible solution. We
> can always state in the manual that we strongly recommend to keep a
> directory structure similar to the one used in Buildroot. But at least
> the user can organize its top-level menu as he sees fit (maybe even
> using it to add board-specific config options, which we don't want in
> Buildroot itself, but which a user may want for some reason).

  With the v2/v4 solution, in the most common case (i.e. the user adds 
some target packages and wants to follow the buildroot directory 
structure), he has to add two files as well: BR2_EXTERNAL/Config.in and 
BR2_EXTERNAL/package/Config.in. That was I think the driving reason why 
we decided on this approach in Edinburgh. I think we even mentioned the 
bootloaders, but I argued that a bootloader is not really different from 
a target package anyway.

  I'll admit, though, that the host packages do make a difference. There 
is no really nice solution there.

  A possibility would be to add another BR2_EXTERNAL_HOST variable, that 
is set by the Makefile to support/dummy-external if
BR2_EXTERNAL/package/Config.in.host doesn't exist. But that solution is 
so ugly that I don't want to see it :-)

  So I agree with reverting to the v2 solution.

  Regards,
  Arnout

>
> The main improvement of v3 is the usage of the .br-external hidden
> file, and this remains useful, so I'm really fine about reverting the
> other part of v3 to what was done in v2 :-)
>
> Best regards,
>
> Thomas
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
