From: Cam Hutchison <camh@xdna.net>
Date: Sun, 3 Sep 2017 22:30:28 +1000
Subject: [Buildroot] [PATCH 1/1] toolchain: detect external glibc in
	symlinked /lib
In-Reply-To: <20170903142517.088907a8@windsurf.lan>
References: <20170903120835.16190-1-camh@xdna.net>
 <20170903141738.20c0d621@windsurf.lan>
 <CABa6e=pwRghNUx+WHY_AH22_Wh8mtvR54x8ApqH3Y11732mhng@mail.gmail.com>
 <20170903142517.088907a8@windsurf.lan>
Message-ID: <CABa6e=rrW8YTJiUxGXfSGxGnQ0-k5q57hFAng8JL9Qo9r+wU+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 3 September 2017 at 22:25, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Sun, 3 Sep 2017 22:22:24 +1000, Cam Hutchison wrote:
>
>> > > When building a toolchain with buildroot and a merged /usr, /lib is
>> > > a symlink to usr/lib. This is copied from the target to the staging
>> > > directory, and then to the sysroot, and the ultimate location of the
>> > > required files is in /usr/lib in the sysroot.
>> >
>> > I don't understand this sentence. Nothing gets copied from target to
>> > staging, and staging *is* the sysroot, so there's no copy. Could you
>> > explain what you wanted to say here, we can perhaps find a better
>> > phrasing.
>>
>> Ok, I wasn't sure on how staging became sysroot - I thought it was
>> copied.
>>
>> I misinterpreted 175a96c4909104bde706fa0e1f9010af8b252caa
>> (package/skeleton-common: simplify staging install) to mean it was
>> copying from the target, but it was the skeleton, not the target.
>>
>> Would you like me to respin this with an updated comment, or will
>> you take it and change it as appropriate?
>
> In fact, I would first like to understand what you meant :)
>
> Maybe what you meant is that: when the Buildroot toolchain is built
> with a merged /usr, lib is a symlink to usr/lib in the staging
> directory. Therefore, the resulting toolchain has such a symlink in its
> sysroot, and such a symlink is present in the staging directory when
> the toolchain is re-used as an external toolchain. The consequence is
> that the dynamic linker is not located in /lib, but in /usr/lib, even
> though it is accessible from /lib from a symlink.

Yes, that's what I meant. The find command that I modified was not finding
the files it was looking for because it would not look in usr/lib (it has a
maxdepth of 2). But it would not look in lib because it was not following
symlinks. So check_glibc never found the files it was looking for and
produced an error.
