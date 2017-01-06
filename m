From: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
Date: Fri, 6 Jan 2017 08:49:43 -0600
Subject: [Buildroot] [PATCH 1/1] pure-ftpd: Added pure-ftpd quotas
	config option
In-Reply-To: <20170105184933.wnnfmvcpmlaubypc@sapphire.tkos.co.il>
References: <1483641714-6962-1-git-send-email-bryce.ferguson@rockwellcollins.com>
 <20170105184933.wnnfmvcpmlaubypc@sapphire.tkos.co.il>
Message-ID: <CAKGmAFp1JP3RCR2=08QHOig1yOAo64X3Ww6Ns19m1sAV0O39Gg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, Jan 5, 2017 at 12:49 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Bryce,
>
> On Thu, Jan 05, 2017 at 12:41:54PM -0600, Bryce Ferguson wrote:
>> Added the pure-ftp quotas option.  When selected, the --with-quotas
>> compiler option is passed which enables the quota feature.
>>
>> Signed-off-by: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
>> ---
>>  package/pure-ftpd/Config.in    | 7 +++++++
>>  package/pure-ftpd/pure-ftpd.mk | 4 ++++
>>  2 files changed, 11 insertions(+)
>>
>> diff --git a/package/pure-ftpd/Config.in b/package/pure-ftpd/Config.in
>> index 85fdef3..df28c4c 100644
>> --- a/package/pure-ftpd/Config.in
>> +++ b/package/pure-ftpd/Config.in
>> @@ -20,4 +20,11 @@ config BR2_PACKAGE_PURE_FTPD_FTPWHO
>>         client sessions.  Only the system administrator may run this.  Output
>>         can be text (default), HTML, XML data and parser-optimized.
>>
>> +config BR2_PACKAGE_PURE_FTPD_QUOTAS
>> +     bool "quotas"
>> +     help
>> +       Enable virtual quotas. With virtual quotas, restrictions can be placed
>> +       on the maximum number of files a user can store in his account.  In
>> +       addition, restrictions can also be placed on the total size.
>
> What is the impact of this feature on executable size? In case the impact is
> small compared to the size of pure-ftpd itself, the general preference in
> Buildroot is to just enable the feature unconditionally.
>
> baruch

I did a build test, one with the feature and one without.  When this
feature is enabled, the executable size increases by a little over
20%.  Hope that helps, thanks for the feedback.
- Bryce
>
>> +
>>  endif
>> diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
>> index 80e432a..95e7065 100644
>> --- a/package/pure-ftpd/pure-ftpd.mk
>> +++ b/package/pure-ftpd/pure-ftpd.mk
>> @@ -49,4 +49,8 @@ ifeq ($(BR2_PACKAGE_PURE_FTPD_FTPWHO),y)
>>  PURE_FTPD_CONF_OPTS += --with-ftpwho
>>  endif
>>
>> +ifeq ($(BR2_PACKAGE_PURE_FTPD_QUOTAS),y)
>> +PURE_FTPD_CONF_OPTS += --with-quotas
>> +endif
>> +
>>  $(eval $(autotools-package))
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

-- 

Bryce Ferguson
Software Engineer
Airborne Information Solutions \ Secure Platforms

400 Collins Rd NE Cedar Rapids, Iowa 52498

Bryce.Ferguson at rockwellcollins.com
