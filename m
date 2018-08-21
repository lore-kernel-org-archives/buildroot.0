From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 21 Aug 2018 20:26:07 +0200
Subject: [Buildroot] [PATCH v2,
 1/2] boost: context needs thread if gcc <= 4.6
In-Reply-To: <20180821112724.3835f7ae@windsurf>
References: <20180820221257.1553-1-fontaine.fabrice@gmail.com>
 <20180821112724.3835f7ae@windsurf>
Message-ID: <CAPi7W80Ly9w5AqmBi=8aA4HnbjR=Jkck8n0fJ5ow+0fQxJyt_Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Le mar. 21 ao?t 2018 ? 11:27, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
a ?crit :

> Hello,
>
> On Tue, 21 Aug 2018 00:12:56 +0200, Fabrice Fontaine wrote:
> > mutex is available on gcc 4.7.x, the issue is that boost does not
> > correctly detect it because -std=c++11 is missing.
>
> Where did you get the information that mutex is available since gcc
> 4.7 ? Is it by testing gcc 4.6 and 4.7 ?
>
I tested with 4.7. but std::mutex is very old, it exists since gcc 4.4 (see
history of
https://github.com/gcc-mirror/gcc/blob/gcc-4_7_0-release/libstdc%2B%2B-v3/include/std/mutex
).
As a result, it probably also works on gcc 4.4, 4.5 and 4.6 but we'll have
to add std=c++0x instead of std=c++11. However, it seems that the current
best practice in buildroot is to add a dependency on gcc 4.7 (poppler), 4.8
(mongodb) or 4.9 (upmpdcli) for C+11 packages (depending on the C++11
features required by the package). We're also adding std=c++11 for 6 C++11
packages (flatbuffers, libcrossguid, libmediaart, libv4l, mosh, ...) but we
never add std=c++0x (except for host-kodi).

>
> I couldn't get this information by looking at
> https://gcc.gnu.org/projects/cxx-status.html#cxx11.
>
> Also, I am wondering if the two patches should really be separate.
> Aren't they in fact both intimately related, where std::mutex will only
> be visible in gcc >= 4.7 if std=c++11 is passed ?
>
> To me, they are basically one single patch:
>
>  - Below gcc 4.7, we don't have std::mutex, so boost-thread must be used
>  - Above gcc 4.7, we have std::mutex, but we need to pass std=c++11 for
>    std::mutex to be visible/usable
>
OK I will merge both patches.

>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180821/77062737/attachment.html>
