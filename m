From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 2 Feb 2012 09:32:46 +0100
Subject: [Buildroot] [RFC 00/15] Automatically produce legal compliance
	info
In-Reply-To: <4F29B30F.303@lucaceresoli.net>
References: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
 <201201312327.22738.yann.morin.1998@free.fr>
 <CAAXf6LVW_4J-aqqRx1DemP42dLnZbBFnGoiPBSa89QmN0E6yoA@mail.gmail.com>
 <4F29B30F.303@lucaceresoli.net>
Message-ID: <CAAXf6LU1jQEHr8bd4XwZ0Ao2jQD_riPSyuyAbfUrT4xWsNMxWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Feb 1, 2012 at 10:47 PM, Luca Ceresoli <luca@lucaceresoli.net> wrote:
> Yann, Thomas,
> thanks for your follow-ups.
>
>
> Thomas De Schampheleire wrote:
>>>
>>>
>>> However, I can see something missing for GPL/LGPL packages. GPL/LGPL
>>> states
>>> that you must also provide "the scripts used to control compilation and
>>> installation of the executable."
>>>
>>> Which means that, for packages such as Linux, busybox and uClibc (maybe
>>> others as well), the associated .config file should be bundled as well.
>>>
>>> Also, the config/build/install instructions for each GPL/LGPL package
>>> must be provided. This could probably be done by bundling the buildroot
>>> sources too in output/legal-info/sources/, or by leveraging the package
>>> infrastructure to output the executed commands for every packages.
>>>
>>> Also, for packages that get patches applied by buildroot, you must make
>>> sure that the tarballs for those packages do contain the pathced code,
>>> or that the patches are bundled as well. From what I see, you currently
>>> only copy the downladed tarballs. Of course, if buildroot is also copied
>>> to the output/legal-info/sources/ the patches will be there.
>>
>>
>> I agree with Yann: I think we should package buildroot itself as well.
>>
>> In fact, I think we should:
>> - make distclean
>> - create the manifest
>> - download all needed sources
>> - run a pre-legal-package script for customization
>> - create a .tar file with the whole
>>
>> The pre-legal-package script (whatever the name) is similar to the
>> post-build script, and allows projects to modify certain things. For
>> example, modify the defconfig to disable some proprietary things that
>> are not useful or usable by the customer.
>>
>> Also, I think the DL_DIR setting should be modified so that it points
>> to the location where the source tarballs are downloaded. This way,
>> the customer can directly use these sources from that location when
>> re-building buildroot.
>>
>> I haven't done a technical review of your patches, but I went through
>> them and agree with the principle. Thanks for posting them before the
>> developer day, it will certainly help the discussion!
>
>
> I think the best way is to just package BR itself in the legal-info
> subdir. I'll have to check if/how it is feasible.
> I'd also copy the current .config, which IMHO is part of the "scripts
> used to control compilation".
>
> OTOH I don't think a pre-legal-package script would be a good idea, as
> it would easily allow to trick and create a fake GPL-compliant release.
> In other words, what I use for building must go directly in the stuff
> to be released.

I don't think we should attempt a guaranteed GPL-compliant release. We
have no control over what someone did with its buildroot repository,
whether or not they modified the LICENSE variables etc. A malicious
company will be able to create a non-compliant tarball in many ways.
By modifying buildroot itself, by using a pre-legal-package script,
but also by post-processing the tarball. It's not something we should
try to guard against IMO.

Moreover, I think there are valid use cases. For example, in our case,
we build a proprietary package from within buildroot. This means we
need the sources available. A customer shouldn't get these sources.
But our .config or defconfig does enable the package. As a result, if
the customer does 'make', there will be an attempt to find the
proprietary sources, and the build will fail.
A pre-legal-package script could make such modifications to the
defconfig file: disable the proprietary packages.
Another use cas is where the pre-legal-package script could copy in
binary proprietary applications from elsewhere.
Or add a README file specific for the project.
Or maybe modify the login banner to indicate in the target image that
this is no official release, but one built by the customer.
Or ...

None of these are attempts to trick the customer or to be deviant from
GPL or other license obligations.

Best regards,
Thomas
