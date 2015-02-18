From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 18 Feb 2015 21:12:03 +0100
Subject: [Buildroot] [PATCH 3/4] br-reproduce-build: fix URL of gitid
In-Reply-To: <20150214215838.GF3886@free.fr>
References: <cover.1423910953.git.yann.morin.1998@free.fr>
 <ca854982ed957dec6bdc523ae2974e0aa630ea75.1423910953.git.yann.morin.1998@free.fr>
 <20150214221014.4643c5cd@free-electrons.com> <20150214215838.GF3886@free.fr>
Message-ID: <CAHkwnC9TvNQCVK4nyvSvD-K2z688nNqWV-rbPrv9=osx=f13NA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Feb 14, 2015 at 10:58 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Thomas, All,
>
> On 2015-02-14 22:10 +0100, Thomas Petazzoni spake thusly:
>> On Sat, 14 Feb 2015 11:52:05 +0100, Yann E. MORIN wrote:
>> > Reported-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> > ---
>> >  utils/br-reproduce-build | 6 ++++--
>> >  1 file changed, 4 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/utils/br-reproduce-build b/utils/br-reproduce-build
>> > index c0dc530..9987684 100755
>> > --- a/utils/br-reproduce-build
>> > +++ b/utils/br-reproduce-build
>> > @@ -16,9 +16,11 @@ if [ $# -ne 1 ] ; then
>> >      exit 1 ;
>> >  fi
>> >
>> > -BUILD_ID=$1
>> > +# BUILD_ID must be in the form xxx/xxxyyyyyyyyyy (xxxyyyyy... being the sha1)
>> > +BUILD_ID="${1#*/}"
>> > +BUILD_ID="${BUILD_ID%${BUILD_ID#???}}/${BUILD_ID}"
>> >
>> > -BUILD_DIR=${OUTPUT_DIR}/${BUILD_ID}
>> > +BUILD_DIR="${OUTPUT_DIR}/${BUILD_ID#*/}"
>>
>> This shell stuff is so complicated that I don't even understand what is
>> the behavior.
>
> Ah, sorry, that's indeed not completely trivial (eveb though I can read
> it quite clearly! ;-) )
>
> What this does is:
>
>   - BUILD_ID="${1#*/}"
>     get rid of anything before a '/', included
>
>   - ${BUILD_ID#???}
>     get rid of the first three chars
>
>   - ${BUILD_ID%foo}
>     get rid of the trailing string 'foo', so:
>
>   - ${BUILD_ID%${BUILD_ID#???}}
>     get rid of all but the first three chars
>
> Thus, what the code above does is:
>
>   - if the user passes a sha1 xxxyyyyyy transform it to xxx/xxxyyyyy
>     (since that the way results are organised on the website
>
>   - if the user already passes xxx/xxxyyyyyyy we simply get rid of the
>     leading xxx/ (even though it is the correct form) to keep the
>     xxxyyyyyy form, and we are back to the first case, above.
>
>> When you say "BUILD_ID must be in the form
>> xxx/xxxyyyyyyyyyy", does it mean that the user is supposed to pass as
>> argument to the script a value in the form "xxx/xxxyyyyyyyyyyy" ? If
>> so, then it's clearly not the intended behavior: the full hash should
>> be sufficient.
>
> Yes, that's exactly the point of all the above: a sha1 should be enough.
> However, if the user is smart enough to pass the xxx/xxxyyyyy form, we
> still accept it.
>
>> Maybe a few more comments would be useful to understand the magic.
>
> Yes, obviously. Sorry, it seemed clear enough to me (but I'm very well
> used to using shell tricks that in retrospect are not so obvious).

I think this patch is useful, are you going to send an updated version?

Thanks and BR
-- 
Fabio Porcedda
