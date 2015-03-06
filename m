From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 6 Mar 2015 05:22:07 +0100
Subject: [Buildroot] [PATCH v2] cmake: don't use any header available in
	$(HOST_DIR)/usr/include
In-Reply-To: <20150305115258.GZ15668@tarshish>
References: <1425516333-3234-1-git-send-email-fabio.porcedda@gmail.com>
 <20150305070255.GY15668@tarshish> <20150305123148.3702fccc@free-electrons.com>
 <20150305115258.GZ15668@tarshish>
Message-ID: <CAHkwnC-keFo5XmUJGoqqJx_jrB0SgpNr5KCDnKw0amWvHz8u6Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 5, 2015 at 12:52 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Thomas,
>
> On Thu, Mar 05, 2015 at 12:31:48PM +0100, Thomas Petazzoni wrote:
>> On Thu, 5 Mar 2015 09:02:55 +0200, Baruch Siach wrote:
>> > On Thu, Mar 05, 2015 at 01:45:33AM +0100, Fabio Porcedda wrote:
>> > > +# Get rid of -I* options to prevent that a header avaiable in
>> > > +# $(HOST_DIR)/usr/include is used instead of a cmake one, e.g. lzma*
>> > > +# headers of the xz package
>> > > +HOST_CMAKE_CFLAGS = $(shell echo $(HOST_CFLAGS) | sed s/-I[^\ ]*//)
>> >
>> > How about (untested):
>> >
>> >     HOST_CMAKE_CFLAGS = $(filter-out -I%,$(HOST_CFLAGS))
>>
>> It unfortunately works only if the form:
>>
>>       -I/foo/bar
>>
>> is used. If you use:
>>
>>       -I /foo/bar
>>
>> which is valid for gcc, then filter-out will filter the -I but
>> not /foo/bar.
>
> Right. But the original sed expression doesn't work either. This one seems to
> work:
>
>         s/[[:space:]]-I[[:space:]]*[^\ ]*//

considering that the -I can be at the start of string:

sed -r "s/(^|[[:space:]]+)-I[[:space:]]*[^[:space:]]*//"

I hope using -r is not a problem because i don't like very much the
version without it:

sed "s/\(^\|[[:space:]]\+\)-I[[:space:]]*[^[:space:]]*//"

Thanks
-- 
Fabio Porcedda
