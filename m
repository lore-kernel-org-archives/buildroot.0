From: Stefan Becker <chemobejk@gmail.com>
Date: Tue, 3 Apr 2018 18:15:06 +0300
Subject: [Buildroot] [PATCH 1/1] core: enhance printvars for variables
 with newlines
In-Reply-To: <20180403165012.0d0e173a@windsurf>
References: <20180403143151.13372-1-chemobejk@gmail.com>
 <20180403165012.0d0e173a@windsurf>
Message-ID: <CAOJ2eMeFDWoG4Xj5tESgxNxxW0PefLHu1+o+ccV+0Nx9H_3yOg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Apr 3, 2018 at 5:50 PM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Just curious, what is the use case for feeding the printvars output
> back into GNU Make ?

Short answer: because we have factored out buildroot image creation
step to a separate build.

Previously it was enough to provide the SDK, output/target/ and a
selected list of source *.mk file s from the "upstream" buildroot
build to be able to do that. With todays @master update the root fs
creation requires internal variables, like PACKAGES_USERS, to be set
correctly to create a valid, bootable image. Which took me a while to
root cause...

Hence we need to use "printvars" to extract the content of those
internal variables from the "upstream" buildroot build into a .mk file
that is passed down to the "downstream" image build, which include's
it in its top-level Makefile (a stripped-down version of buildroot
top-level Makefile). The variables we are interested in unfortunately
contain newlines.

Regards, Stefan
