From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue, 10 Apr 2018 23:00:16 +0300
Subject: [Buildroot] [PATCH 1/1] zeromq: bump to version 4.2.5
In-Reply-To: <20180410093224.5a003151@windsurf>
References: <20180407072909.25962-1-asafka7@gmail.com>
 <20180410093224.5a003151@windsurf>
Message-ID: <CALFsTFV1mGchLpZxTPr7tupig4eHhXzs_ezTnGFzaUrK=TT3Sw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

About the dynamic library support, I looked at it and I you're right. I'll
send a patch with update for this issue and also add myself to the
DEVELOPERS file.
About pthread_condattr_setclock on uClibc, I'll take a look at this and
look for a solution.

Asaf.

On Tue, Apr 10, 2018 at 10:32 AM, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> On Sat,  7 Apr 2018 10:29:09 +0300, Asaf Kahlon wrote:
> > Update the ZEROMQ_SITE with the active repository.
> > Remove the two patches because they were both applied on zeromq.
> > As a result, the ZEROMQ_AUTORECONF was removed.
> >
> > Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
>
> This update causes a large number of build failures:
>
>   http://autobuild.buildroot.net/?reason=zeromq-4.2.5
>
> Apparently, there are two problems:
>
> http://autobuild.buildroot.net/results/e4a/e4af0a1b47aacd3ec8fe678641fb8a
> bae84aa4b6/build-end.log
>
> src/condition_variable.hpp: In constructor 'zmq::condition_variable_t::
> condition_variable_t()':
> src/condition_variable.hpp:278:58: error: 'pthread_condattr_setclock' was
> not declared in this scope
>          pthread_condattr_setclock (&attr, CLOCK_MONOTONIC);
>                                                           ^
>
> I think that in uClibc, pthread_condattr_setclock() requires NPTL
> support. Perhaps Waldemar (in Cc) can confirm.
>
> The other problem is:
>
> http://autobuild.buildroot.net/results/384/3841ce5fecf6fcdc52048123094ad6
> 1a14287c52/build-end.log
>
> checking for library containing dladdr... no
> configure: error: unable to find the dladdr() function
>
> So apparently it now needs dynamic library support.
>
> BTW Asaf, we don't have anyone listed in the DEVELOPERS file to take
> care of the zeromq package. If you're using it, would you be willing to
> take care of it ?
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180410/a4efdcf2/attachment.html>
