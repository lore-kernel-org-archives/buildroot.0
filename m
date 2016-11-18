From: =?UTF-8?Q?J=C3=A9r=C3=B4me_Pouiller?= <jezz@sysmic.org>
Date: Fri, 18 Nov 2016 09:49:51 +0100
Subject: [Buildroot] [PATCH 00/15] Reproducible builds
In-Reply-To: <20161117150855.4b2c99b9@free-electrons.com>
References: <1479376839-27795-1-git-send-email-jezz@sysmic.org>
 <20161117121341.4a63ed15@free-electrons.com>
 <9798cfe2186532e99707f24481a2a03a@sysmic.org>
 <20161117150855.4b2c99b9@free-electrons.com>
Message-ID: <abab99dd97db78785de3ba2f274cac65@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2016-11-17 15:08, Thomas Petazzoni wrote:
[...]
> Another (unrelated) question: how can we test this stuff? You're
> providing the initial steps for it, but at some point, we will want to
> validate which packages behave properly and which packages don't behave
> properly. Have you already thought of automated testing we can do (in
> the autobuilders perhaps?) to exercise this "reproducible builds"
> functionality? Should we from time to time do a given builds twice,
> each time in a different environment (different date, different time,
> different user, different path, different timezone, different locale,
> etc.) ?

In a first time, compiling each configuration twice, diffing 
$(TARGET_DIR)
and find guilty packages using packages-file-list.txt should be enough 
to find
a many errors. We may also grep $TARGET_DIR for most common error 
patterns
(hostname, user, ...)

In a second time, I think reproducible build is an excellent tool to 
validate
top level parallelization.

Finally, for more accurate checks, we need to compile same configuration 
on
different host. I didn't check autobuilder sources, but it seems it 
would
involve a new autobuilder design.


> To what extent do we try to be reproducible? Do we try to have
> something that produces the same result when executed multiple times,
> but on the same machine, in the same environment (i.e only date/time
> changes) ? Or do we try to go the point where a given Buildroot .config
> gives a byte identical output regardless of the host machine on which
> you do the build? It would be great to know what our definition of
> "reproducible is", and document it in the help text of the
> BR2_REPRODUCIBLE option.

Ideally, "reproducible" mean that a binary result only depends on 
Buildroot
version and user configuration (sure, if a custom script have a 
non-reproducible
behavior, result won't be reproducible).
Currently, there are few known (and doubtless many unknown) bugs:
    - build paths have to be the sames
    - lzop shouldn't be used

BR,

-- 
J?r?me Pouiller
