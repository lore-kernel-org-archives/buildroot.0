From: Will Newton <will.newton@gmail.com>
Date: Fri, 2 Mar 2012 09:55:15 +0000
Subject: [Buildroot] DL_TOOLS_DEPENDENCIES and PRIMARY_SITE
In-Reply-To: <20120302103747.7f8ef528@skate>
References: <CAAXf6LXfd_w5muFabHEFxYKgCFSsrsCCX0Cqibpfz0o7NZt1wQ@mail.gmail.com>
 <20120302103747.7f8ef528@skate>
Message-ID: <CAFbHwiSCvx_GnYbNWacgZbeh88LCy=kwvhSvd-_oLg9oHNA4Tw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 2, 2012 at 9:37 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

Hi Thomas,

>> Some suggested solutions:
>> 1. change support/dependencies/dependencies.sh to output a warning
>> instead of an error for the DL_TOOLS. If the tool cannot be found when
>> used, the shell will throw an error.
>>
>> 2. when PRIMARY_SITE is set, don't fill DL_TOOLS at all (so don't
>> check in support/dependencies), and let the shell handle a missing
>> tool.
>>
>> 3. Don't check the DL_TOOLS in support/dependencies upfront, but
>> rather in the DOWNLOAD function when you actually need a certain tool.
>
> The problem with (2) is that PRIMARY_SITE is only a *preferred*
> location for download. If that location does not contain the requested
> tarball, then we fall back to the normal download method, and in that
> case we would need git/bzr/svn/etc. Or we would need to change the
> semantic of PRIMARY_SITE so that we *only* look at PRIMARY_SITE and do
> not fall back on the normal download method (and therefore abort the
> build if PRIMARY_SITE does not contain all the desired tarballs).

The way I currently have our buildroot tools setup is to use a local
mirror of packages as the primary site for speed and reliability
reasons. When building an SDK release for customers the code is
exported and I run "make source" to pull all the packages from our
local mirror to populate the dl directory and then package it up. This
means the customer gets all the source packages for the basic system
included in the SDK but can also expand the list of packages if they
wish to customize what we've given them and then of course they would
have to have wget/git/svn installed as appropriate.

From that perspective the checks for the tools up front are kind of
good and bad - in the basic case where the customer is just using the
SDK as shipped then they do not need to download anything so the
checks are useless, but if they then go on to customize it then the
checks are useful.
