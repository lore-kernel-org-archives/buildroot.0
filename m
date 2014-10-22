From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Wed, 22 Oct 2014 19:15:36 +0200
Subject: [Buildroot] [PATCH] intltool: fix build
In-Reply-To: <20141022180339.47298e90@free-electrons.com>
References: <1413571681-27963-1-git-send-email-francois.perrad@gadz.org>
 <20141022180339.47298e90@free-electrons.com>
Message-ID: <CAB0FRsv_6MEV1WuboQcWp9YpZgz4xvCTg9fr4t2cBy4ydfR6qg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-10-22 18:03 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Francois Perrad,
>
> On Fri, 17 Oct 2014 20:48:01 +0200, Francois Perrad wrote:
>> fix various build failures caused by host-perl serie
>>
>> Currently, the variables PERL & PERL2LIB are available
>> only during the configure step of host-intltool.
>> There are also needed when running host-intltool,
>> in all package which depends on host-intltool.
>>
>> So, there are now global, but in the perl infrastructure,
>> we cannot use them.
>>
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> ---
>>  package/Makefile.in          | 9 +++++++--
>>  package/intltool/intltool.mk | 3 ---
>>  package/pkg-perl.mk          | 2 +-
>>  3 files changed, 8 insertions(+), 6 deletions(-)
>
> Can you cook an updated version of this patch that takes into account
> the comment you have received? It would help us fix a number of Perl
> related autobuilder issues.
>

When I try to do that you suggest, I only obtain no working result.

I think that comments from Arnout, come from a pure review but no from
testing or experiment.

This patch doesn't try to fix the package host-intltool, it fixes the
packages which depend on host-intltool.
Currently, this kind of package is broken in the configure step
because they can not find the correct perl.
So, the variable INTLTOOL_PERL=$(PERL) in *_CONFIGURE_OPTS is mandatory.

When PATH=$(BR_PATH), `which perl` find the system perl when host-perl
is not yet installed, after it find the host-perl.
So, it is important to save the result of `which perl` with the
original PATH (ie. without $(HOST_DIR)/usr/bin).

The current patch stay the best that I can do (the commit message can
always be improved).

Fran?ois

> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
