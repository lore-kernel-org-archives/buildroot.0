From: Erico Nunes <nunes.erico@gmail.com>
Date: Sun, 28 Oct 2018 08:59:14 +0100
Subject: [Buildroot] [PATCH 1/1] linux-firmware: bump version and fix
 hash
In-Reply-To: <20181003194023.GA2383@scaer>
References: <20180926223806.12704-1-nunes.erico@gmail.com>
 <87mus2vkos.fsf@dell.be.48ers.dk>
 <CAK4VdL0mu+5Od73gU4T7dRLVRHior7gYg6NQ3+bNKms9P5R=EQ@mail.gmail.com>
 <20181003194023.GA2383@scaer>
Message-ID: <CAK4VdL0_csVF1ZpA=J+V1J9o1v-1DRUNn9P6p7XymG_SEonn2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 3, 2018 at 9:40 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Erico, All,
>
> On 2018-10-03 21:11 +0200, Erico Nunes spake thusly:
> > On Thu, Sep 27, 2018 at 8:50 PM Peter Korsgaard <peter@korsgaard.com> wrote:
> > >  > ERROR: linux-firmware-8d69bab7a3da1913113ea98cefb73d5fa6988286.tar.gz has wrong sha256 hash:
> > >  > ERROR: expected: 905be20e4e2d7628dea4e2e99195520fc0cce8b247faabdc52fc44a3ff2ceb04
> > >  > ERROR: got     : b9fce72a7b0b55eb311701dfd47914bc9e037134fa401d33e6e73ab9ebc9d116
> > >  > ERROR: Incomplete download, or man-in-the-middle (MITM) attack
> > > Hmm, odd?
> [--SNIP--]
> > I see that the hash got updated again after this commit, and now it's
> > broken again for me.
> > I re-tested on more machines running Fedora 28 or Centos 7, including
> > one where I had never used Buildroot before, and apparently I even get
> > different hashes on each for linux-firmware:
> >
> > ERROR: linux-firmware-44d4fca9922a252a0bd81f6307bcc072a78da54a.tar.gz has wrong sha256 hash:
> > ERROR: expected: b279ca4d086887c2efab13e28a7ca36e409410d3df38a62d7c7b5799ee3de916
> > ERROR: got     : 12d025328deab2bd2bec489c5f51181db6530cc9eb91d10ef66a55c18c2da8bf
> [--SNIP--]
>
> Weird; I do get the correct hash:
>     linux-firmware-44d4fca9922a252a0bd81f6307bcc072a78da54a.tar.gz: OK (sha256: b279ca4d086887c2efab13e28a7ca36e409410d3df38a62d7c7b5799ee3de916)
>
> > Is there some known cause for this?
>
> In the past, this could have been caused by a too-olld or too-recent tar
> version. But nowadays, we do build our own tar when we need it. Can you
> check what tar Fedora 28 has, and check whether Buildroot built host-tar
> or not?

Ok so I finally tested this out and it seems to be due to two reasons:

1) The tar version in Fedora is 1.30, Buildroot host-tar is 1.29. I
can reproduce it using 1.30, if I force a host-tar build before
getting the source, it works.

2) This is a bit unsupported and I had already tried disabling it
before reporting, but I was experimenting with system-side pigz
(something like https://askubuntu.com/a/62608), this seems to affect
it too.

Ignoring (2) for now, tar 1.30 seems to be an issue.

Locally bumping the Buildroot host-tar to 1.30 reproduces the issue to
me. Also to confirm, downgrading my Fedora tar version to 1.29 no
longer reproduces the issue.

I see that support/dependencies/check-host-tar.sh has some handling
for tar 1.30 already, but it doesn't seem to be triggering for me.
Maybe it is because I switched to testing with 'make source' rather
than a full build to test it quickly?


Erico
