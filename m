From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 17 Sep 2013 08:07:43 +0200
Subject: [Buildroot] [PATCHv2 0/4] Add a BR2_EXTERNAL mechanism
In-Reply-To: <20130917063717.1b005fd2@skate>
References: <1379185433-8770-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <52376C45.1020406@mind.be> <20130917063717.1b005fd2@skate>
Message-ID: <5237F1AF.8000400@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/09/13 06:37, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
>
> On Mon, 16 Sep 2013 22:38:29 +0200, Arnout Vandecappelle wrote:
>
>>    I've taken a few days to let the dust settle on this patch series
>> (and it seems it still hasn't settled...). After reading the entire
>> series this time (instead of commenting before I understood what was
>> happening exactly), I have two overall comments still. More comments
>> will follow in individual patches.
>>
>>
>> 1. Peter nacked all previous attempts of having this type of feature,
>> so I think it's best if he gives an indication if this series has a
>> chance of survival before we all spend more time on it.
>
> Adding Peter in Cc on this one. I know he is a bit behind in terms of
> reading the backlog of Buildroot e-mails (which has been enormous since
> a few days).
>
> I have the pretension of thinking that the currently proposed
> implementation is simple enough to remain in the KISS spirit of
> Buildroot. I believe that what prevented earlier implementation from
> being merged was not so much that they allowed 'external packages',
> but more due to their complexity. But honestly, I don't really remember
> the implementation details of the previous proposals, so I might be
> wrong on that one.
>
>> 2. I really have a huge problem with the fact that the .config is no
>> longer complete, and that instead you have to explicitly provide
>> extra command-line arguments to be able to reproduce the build. And
>> it doesn't help that it behaves differently when you have an
>> out-of-tree output directory (where the BR2_EXTERNAL is stored) than
>> when you're using the default output directory. I'm actually very
>> surprised that nobody else seems to have a problem with this. So for
>> me, this gets a big Nack unless the BR2_EXTERNAL is stored in
>> the .config.
>
> On the wrapper Makefile that contains BR2_EXTERNAL, I am not convinced
> it is a good idea, since as you mention it creates a difference whether
> you're building out-of-tree from the output directory, or out-of-tree
> but from the source directory. I think this is not good, and therefore
> that BR2_EXTERNAL shouldn't be kept in the wrapper Makefile.
>
> However, I still do not understand how storing BR2_EXTERNAL in .config
> will clarify things for the user. Changing BR2_EXTERNAL affects what
> 'menuconfig' shows. So there is no way for 'menuconfig' to update what
> it displays when the user changes the value of BR2_EXTERNAL without
> exiting/re-running menuconfig, which sounds really odd.
>
> To me, BR2_EXTERNAL= is a bit like O=, it's a local build decision that
> you make to add some external configurations/external packages. Most
> likely, if you have external packages in BR2_EXTERNAL, the defconfig
> you have to use is also in BR2_EXTERNAL, so there's no way you can
> forget to specify BR2_EXTERNAL on the command, since otherwise you
> won't be able to even see your defconfig.

  But you usually don't run "make foo_defconfig; make". You usually run 
either "make menuconfig; make" or "make foo-dirclean; make" or some other 
variant.

  I just think it's a really bad idea to split the buildroot 
configuration over the .config file and the environment. The concept just 
scares the hell out of me.

  The comparison with O= is a good one: O= makes pretty damn sure that 
things remain consistent, because the .config is stored in the O= 
directory rather than someplace else.



> So while I do agree that being able to store BR2_EXTERNAL would be
> nice, I don't see how it can be achieved in a way that isn't confusing
> for the user.

  Since the user probably is never going to change the value of 
BR2_EXTERNAL, I think that's a relatively small price to pay and that it 
can be solved with documentation.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
