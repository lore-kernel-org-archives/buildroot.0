From: Schwarz, Konrad <konrad.schwarz@siemens.com>
Date: Fri, 8 Jan 2021 12:32:19 +0000
Subject: [Buildroot] [PATCH 2/3] package/environment-setup: make script
 idempotent
In-Reply-To: <aacff91f-ea3c-ed65-3906-0cc8ac3bf30f@mind.be>
References: <20201231212949.2415485-1-konrad.schwarz@siemens.com>
 <20201231212949.2415485-3-konrad.schwarz@siemens.com>
 <aacff91f-ea3c-ed65-3906-0cc8ac3bf30f@mind.be>
Message-ID: <b80a6fab1082443ea9bd5cd423642b38@siemens.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

> -----Original Message-----
> From: Arnout Vandecappelle <arnout@mind.be>
> Sent: Thursday, January 7, 2021 22:43
> To: Schwarz, Konrad (T RDA IOT SES-DE) <konrad.schwarz@siemens.com>; buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH 2/3] package/environment-setup: make script idempotent

> > The code has also been simplified
> > (using standard POSIX shell features) and make the generated script
> > more readable, e.g., by splitting overly long lines.
> 
>  Maybe the generated script is more readable (and I'm not entirely convinced), but the code in the .mk file is much *less* readable.

Well, beauty is obviously in the eye of the beholder. 

Objectively, the change eliminates wrapping each generated line with
"printf ... >> $(ENVIRONMENT_SETUP_FILE)" by placing the code in a compound block,
and can eliminate the variable ENVIRONMENT_SETUP_FILE, since its value ends up being used
only once in the result.

It eliminates the for ;do done loop over TARGET_CONFIGURE_OPTS, because printf(1) has this ability built in.

It eliminates all occurrences of backslash-escaped double quotes, because it uses single quotes to
quote strings (that may contain double quotes).

Backslash escapes are still required to indicate the ends of continued lines in the generated shell file
(i.e., a backslash followed by a newline), but I value the readability of the generated file high enough so I am
willing to make that trade-off.   This is because I expect many more users to look at the generated script than its'
generator to figure out what the script does (and where it fails).

The number of these sequences could have been reduced by using more printf
statements; I don't think that alternative is a clear win, because you would end up with more mental switches
between generator and generated code.

It eliminates re-editing of the generated file by using sed as a filter in a pipeline.

>  If you want to make it more readable, I think it would be better to do change the environment-setup script to environment-setup.in
> that contains @VAR@ references which are replaced with sed. In fact, since this kind of approach is used in many places, it would be
> worth adding a make function that does exactly that. But maybe that's going a bit too far :-)

I don't see how that technique is applicable here; simple substitution of this sort is also prone to breakage
(aka SQL injection).

>  Also, this change of how the script is formatted should be split in a separate patch from the PATH manipulation, they are pretty much
> unrelated.

I hope the individual changes to the script mechanics have now been sufficiently motivated.

--
Konrad
