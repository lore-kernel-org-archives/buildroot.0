From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Sun, 7 Aug 2016 10:33:06 -0400
Subject: [Buildroot] Analysis of build results for 2016-08-05
In-Reply-To: <20160807112654.7b520594@free-electrons.com>
References: <20160806063028.356101023A1@stock.ovh.net>
 <20160807112654.7b520594@free-electrons.com>
Message-ID: <CA+-urNTtANeREZCA=Axuub2BHOyeov3_FMMroHt9MuMrk7U5GA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Aug 7, 2016 at 5:26 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>>          arm |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/802b6d77e1b77b7c8fcb8f3b394cdabfd406de7a/
>
> libconfuse issue. I know Frank was working on this, we discussed it on
> IRC, but I can't recall the details. Frank?
>

Sorry for being quiet on this issue. I've been so busy at work that I
didn't make much progress after our IRC discussion.

I didn't look hard at the failure above, but it did look similar to
the others. The common thread in the previous failures was static
linking, libintl, and pthreads. There are two issues:

The first was that fwup wasn't using the pkgconfig information so when
libconfuse has a transitive dependency on libintl, libintl wasn't
being linked in and the autoconf test for libconfuse would fail.
That's fixed in fwup 0.8.1, so all that needs to be done is for the
version bump to be pulled into Buildroot. I haven't sent a patch
because of the second issue.

The second issue is that both libintl and libarchive depend on
pthreads, but don't list that dependency in their pkgconfig data.
libintl doesn't even have a .pc file. The pthreads dependency is a
little silly, since both libraries only use mutexes, but it causes
linker errors nonetheless. This is where I timed out. Is the answer to
make fwup depend on pthreads, fix libarchive, or fix libintl? I was
also surprised that other programs hadn't run into this issue as well,
so maybe there's another option out there. Any help on this would be
appreciated.

Frank
