From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 18 Feb 2016 01:02:30 +0100
Subject: [Buildroot] [Question] Including only needed makefiles?
In-Reply-To: <20160217095923.GB3444@free.fr>
References: <CAK7LNAQNQp_zm-QFyaMhtPtJt+h3BkiwEasXTc6twFm5W_dUnw@mail.gmail.com>
 <20160217091115.0f89f400@free-electrons.com> <20160217095923.GB3444@free.fr>
Message-ID: <56C50A16.2030507@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17-02-16 10:59, Yann E. MORIN wrote:
> Yamada-san, Thomas, All,
> 
> On 2016-02-17 09:11 +0100, Thomas Petazzoni spake thusly:
>> On Wed, 17 Feb 2016 13:00:26 +0900, Masahiro Yamada wrote:
>>> I am not an active developer of Buildroot.
>>> Apology if I am asking a silly question.
>> Your question is not silly at all!
> 
> Indeed. No question is stupid. You're welcome to ask.
> 
> [--SNIP--]
>>> [2]
>>> If we achieve the perfect dependency in Kconfig,
>>> perhaps can we include makefiles that are really
>>> enabled by Kconfig?   For example, like this?
>>>
>>> pkg-$(BR2_PACKAGE_BUSYBOX) += busybox
>>> pkg-$(BR2_PACKAGE_LAME)    += lame
>>> pkg-$(BR2_PACKAGE_GZIP)    += gzip
>>>    ...
>>>
>>> include $(addprefix packages, $(addsuffix Makefike, $(pkg-y)))
>>
>> I propose such a change two years ago, see my RFC patch series at:
>>
>>    http://lists.busybox.net/pipermail/buildroot/2014-March/092548.html
>>
>> The main complexity is that while target packages all have a Config.in
>> options, it is not the case for host packages. And therefore, changing
>> to a per package makefile inclusion requires adding lots and lots of
>> Config.in options for host packages.
>>
>> Another issue (explained in the cover letter) was that we could no
>> longer use sub-directories in packages, such as
>> package/qt5/qt5base/qt5base.mk.
> 
> Well, except with Yamada's proposal (or something similar), we could
> explicitly manage the sub-directories, like so:
> 
>     pkg-$(BR2_PACKAGE_FOO) += foo
>     pkg-$(BR2_PACKAGE_BAR) += sub-dir/bar

 One big problem with this: what to do with host packages?

> 
>     -include $(addprefix packages/,$(foreach p,$(pkg),$(p)/$(notdir $(p)).mk))
> 
> Of course, that means explicitly listing all packages, instead of the
> current glob-include. But sinc ewe're already explicitly source-ing
> Config.in files, this would make it symetric for the .mk files as well.

 I have the feeling this is going to be an added maintainance burden. Or at
least, a burden for adding packages. But it's not really that big a deal.

 We'd have to think about what to do with the subdirectories though.

> 
>> If you look at the feedback of the patch series, it was generally quite
>> positive, but this needs more work, and is only saving a few seconds of
>> make parsing, which are not such a big deal. So the effort is fairly
>> big for limited savings.
> 
> Indeed, I don't believe the few startup seconds are that problematic.
> Yes, they are annoying.

 They're horribly annoying. I'm an avid user of bash-completion and my tab key
remains pressed virtually continuously. So I'm all the time going 'make
busy<TAB>' Argh!


 Regards,
 Arnout

> 
> It takes roughly 3s on my machine (dual core-i5 with SSD), but I can see
> that it could take quite a bit more on leww powerful machines,
> especially those with rotating rust...
> 
>> I would personally rank implementing top-level parallel build at a much
>> higher priority level than this micro-optimization.
> 
> Agreed.
> 
> Regards,
> Yann E. MORIN.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
