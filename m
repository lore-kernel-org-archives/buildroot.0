From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 May 2013 21:26:16 +0200
Subject: [Buildroot] Design issue with the out-of-tree support
In-Reply-To: <20130527215354.133444a6@skate>
References: <20130523131251.2ffc509f@skate> <51A38EEE.7000406@mind.be>
 <20130527211200.735491c7@skate> <51A3B793.6050409@mind.be>
 <20130527215354.133444a6@skate>
Message-ID: <51A504D8.3040607@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/05/13 21:53, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
>
> On Mon, 27 May 2013 21:44:19 +0200, Arnout Vandecappelle wrote:
>
>>> For now, I consider doing the prepare step even on OVERRIDE_SRCDIR
>>> package, even if that means that we are modifying the source directory.
>>
>>    Given that we've recently accepted some patches that solve problems of
>> non-writeable source directories, I don't think this is appropriate. I
>> think it's a valid use case to use OVERRIDE_SRCDIR to define the custom
>> source of a package, which is located in some shared directory. Having
>> random builds modifying that source is not appropriate.
>>
>>    And now is the time to define this behaviour - changing it later can be
>> considered "ABI breakage".
>
> Right.
>
> What about packages that are using the "local" site method (which
> basically, are equivalent to doing OVERRIDE_SRCDIR) ?
>
> I know some people (or, said otherwise, customers) that use the local
> SITE_METHOD for autotools-based components. Those are version
> controlled, and of course, only configure.ac + Makefile.am are version
> controlled. So, when the build starts, "something" should do the
> autoreconf.
>
> If Buildroot doesn't do it, who will do it? The user manually, when
> there are 30+ software components? Doesn't seem really practical and
> realistic.

  Well, actually the autotools-generated makefile will itself detect that 
configure.ac has changed and regenerate it in the source directory, so a 
non-writeable source directory will be broken anyway.

  Okay then. If anyone has an issue with buildroot messing with their 
OVERRIDE_SRCDIR, they can still add a OVERRIDE_SKIP_PREPARE variable that 
disables the prepare step.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
