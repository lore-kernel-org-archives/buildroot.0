From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 7 Aug 2014 09:37:13 +0200
Subject: [Buildroot] [PATCH v4 2/2] apply-patches.sh: don't print
 anything when "make -s" is used
In-Reply-To: <20140806191641.GB1587@free.fr>
References: <1406892298-9460-1-git-send-email-fabio.porcedda@gmail.com>
 <1406892298-9460-3-git-send-email-fabio.porcedda@gmail.com>
 <20140806191641.GB1587@free.fr>
Message-ID: <CAHkwnC-0saLzBWo0jNK5vsr4o6YwDN5-PST0ehGHVH=-hyfK3Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 6, 2014 at 9:16 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Fabio, All,
>
> On 2014-08-01 13:24 +0200, Fabio Porcedda spake thusly:
>> The make "-s" option is used to enable the "Silent operation" so if that
>> option is used don't print anything as far as there isn't any error.
>>
>> Add the "-s" option to "apply-patches.sh" to enable silent operation.
>>
>> Also add the "BR_SILENT" variable the contain "YES" when "make -s" is
>> used so others parts can use it to silence the build as well.
>>
>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> HOwever, I have a comment about it, see below...
>
>> ---
>>  Makefile                         |  2 ++
>>  package/Makefile.in              |  2 +-
>>  support/scripts/apply-patches.sh | 17 ++++++++++++++---
>>  3 files changed, 17 insertions(+), 4 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index c82b07f..73eb033 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -198,6 +198,8 @@ else
>>    Q = @
>>  endif
>>
>> +BR_SILENT = $(if $(findstring s,$(MAKEFLAGS)),YES)
>
> Unfortunately, that also matches '--warn-undefined-variables' since it
> has an 's' in it. It is the onlt long option with an 's' in it, for
> which there is no corresponding short option. All other long options
> with an 's' in them have corresponding short options, and that's what
> appears in MAKEFLAGS.

Good point, I was confused by the official documentation of Make:
http://www.gnu.org/software/make/manual/make.html#Testing-Flags

Using the filter function instead of substring  fix the problem:

-BR_SILENT = $(if $(findstring s,$(MAKEFLAGS)),YES)
+BR_SILENT = $(if $(filter s -s,$(MAKEFLAGS)),YES)

I will send an updated patch.

> I think we can well live with the fact that --warn-undefined-variables
> would trigger a silent patching, because this should really only be
> rarely used, if at all, because we do rely on variables not being
> defined, so this is not an error, not even a warning.
>
> That's why I added my reviewed tag.

Thanks
-- 
Fabio Porcedda
