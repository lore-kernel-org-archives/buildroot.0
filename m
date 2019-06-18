From: Victor Huesca <victor.huesca@bootlin.com>
Date: Tue, 18 Jun 2019 14:11:07 +0200
Subject: [Buildroot] [PATCH 0/4] Sanetize packages version
In-Reply-To: <3e5a390a-1d1b-2619-4d36-0538946982f8@mind.be>
References: <20190612064209.23619-1-victor.huesca@bootlin.com>
 <20190612092624.1ca7836d@windsurf>
 <3e5a390a-1d1b-2619-4d36-0538946982f8@mind.be>
Message-ID: <6c0a7ab6-bd07-c06d-d818-4e56b6ba41aa@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/06/2019 10:51, Arnout Vandecappelle wrote :
> 
> On 12/06/2019 09:26, Thomas Petazzoni wrote:
>>
>> On Wed, 12 Jun 2019 08:42:05 +0200
>> Victor Huesca <victor.huesca@bootlin.com> wrote:
>>
>>> In particular packages fetched via git cannot be easily sanitized. The
>>> implementation behind the git method is to use the <pkg>_VERSION after the
>>> rope cloning to checkout the version tag. A workaround could be to add a
>>> new variable to the infrastructure that can be set to specify the tag for
>>> these cases.
>>
>> I guess an example of this is the "at" package, which has:
>>
>> AT_VERSION = release/3.1.23
>> AT_SITE = https://salsa.debian.org/debian/at.git
>> AT_SITE_METHOD = git
>>
>> but we would probably want the version to be just "3.1.23", like is
>> tracked at https://release-monitoring.org/project/127/.
>>
>> So indeed, I see two possible directions here:
>>
>>  (1) Keep the <pkg>_VERSION semantic as it is today, and add a separate
>>      <pkg>_UPSTREAM_VERSION variable (or some other name) that holds the
>>      upstream version. This would give:
>>
>>      AT_UPSTREAM_VERSION = 3.1.23
>>      AT_VERSION = release/$(AT_UPSTREAM_VERSION)
>>
>>      With this, no need to change anything in the package
>>      infrastructure, we just need <pkg>_UPSTREAM_VERSION be extracted
>>      by support/scripts/pkg-stats, which is can trivially do instead of
>>      extracting <pkg>_VERSION.
>>
>>      This approach also has the advantage that the name of the tarballs
>>      stored on disk doesn't change, which means all the DL_DIR contents
>>      + sources.b.o content remain identical.
>>
>>      Of course, the package infrastructure defines
>>      <pkg>_UPSTREAM_VERSION to <pkg>_VERSION if there's no
>>      <pkg>_UPSTREAM_VERSION value defined for a given package.
>>
>>  (2) As suggested by Victor, add a separate variable that tells the Git
>>      download logic what is the actual tag/version to fetch, i.e:
>>
>>     AT_VERSION = 3.1.23
>>     AT_GIT_COMMIT = release/$(AT_UPSTREAM_VERSION)
> 
>  I'm in favour of this second solution, but call the variable $(PKG)_REVISION.
> 
>  Actually, I think _DL_VERSION already covers it. The only thing we have to do
> is to make the assignment conditional, i.e. allow pre-assigned _DL_VERSION.
> 
>  Alternatively, we introdcue a _REVISION ?= _VERSION and use that for
> _DL_VERSION instead of _VERSION.

I would also be more on the second solution and use the existing
_DL_VERSION as Arnout suggested. I has the advantage of not introduce a
new variable and require only 3 lines to change pkg-generic infra.

If we chose to use this variable to handle these cases we will have to
mention it in the manual as it is currently only use in buildroot's
internal infrastructure.

-- 
Victor Huesca, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
