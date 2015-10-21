From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Oct 2015 22:39:49 +0200
Subject: [Buildroot] [PATCH 1/1] Add more options to eudev package.
In-Reply-To: <20151021221804.483ac95d@free-electrons.com>
References: <CAOcYpt2ah7+P2ZJyzN+i0DjxE+x9LiDZPWwg6zqMxzi-x7BhKQ@mail.gmail.com>
 <20151020203326.GA31310@free.fr>
 <CAOcYpt1nwhHC7d_rpG3G5J+u8z8FaXykSntgp85NBQ1ziCy7ww@mail.gmail.com>
 <CAOcYpt3=T60_0NWWaCPsidFOC_vcZrCcGv5s9VH+AHJnb0ckjw@mail.gmail.com>
 <CAOcYpt3FL4sTBF-Edk4ShGX2vE2wGYX4gp7jHmsfDMxxA=03DA@mail.gmail.com>
 <20151021212450.1c6fc5b4@free-electrons.com> <5627EEE3.3010302@mind.be>
 <20151021221804.483ac95d@free-electrons.com>
Message-ID: <5627F815.6090701@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21-10-15 22:18, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 21 Oct 2015 22:00:35 +0200, Arnout Vandecappelle wrote:
> 
>>> While I understand what you are trying to do, I am not sure we can
>>> support this in Buildroot upstream. You want eudev to be in / and
>>> not /usr, but maybe the next person will want this other package to be
>>> in / and not /usr. How do we handle this ? Add one more option to all
>>> packages ? Doesn't seem really maintainable.
>>
>>  Actually, it makes sense to me to install it completely in / instead of /usr -
>> that would also remove the need to have all the --libdir etc. options that we
>> currently pass. The way it's currently done, eudev's install anyway adds
>> symlinks back from /lib/libudev.so to /usr/lib/libudev.so.
> 
> If we install it unconditionally in /, then it's fine with me. What I
> would dislike is to start having options for such things.
> 
> However, there is still the question: why eudev in /, and not any other
> package that other users may find important to have in / ? Where do we
> put the boundary ?

 Because eudev is already installed mostly in / - as I said, even if libudev.so
is installed in /usr/lib, there's still a symlink created to point to it from
/lib. Same for udevadm: installed in /usr/bin but a symlink is created from
/bin. Basically, it's eudev itself that decides it should be in / in addition to
/usr.

 That said, I don't think David's use case is one that we should support,
because IMHO it's the wrong way to go at it. I think it's better to make a
separate full filesystem and either pivot_root or union-mount it. I think
depending on the /bin or /usr/bin location is a recipe for disaster.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
