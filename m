From: Stephan Hoffmann <sho@relinux.de>
Date: Tue, 12 Feb 2013 11:30:00 +0100
Subject: [Buildroot] Report from the Buildroot Developers Meeting
In-Reply-To: <20130209004253.207e0741@skate>
References: <20130209004253.207e0741@skate>
Message-ID: <511A19A8.4020307@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 09.02.2013 00:42, schrieb Thomas Petazzoni:
> Hello,
>
>
>   http://elinux.org/Buildroot:DeveloperDaysFOSDEM2013#List_of_topics_to_discuss
>
> Do not hesitate to comment those discussions as a reply to this e-mail.
Hello all,

here my .02? to the discussions:

> What to do with systemd/udev/eudev: we try to use the udev from
> systemd without systemd. Exactly how we don't know yet... There's a
> risk that udev becomes unusable without systemd, but Leonard
> Poettering promised this would not happen. After a quick look, it
> turns out that you always end up building systemd, which requires
> dbus, even if you need only udev. So it makes the systemd source
> tarball a bit unpractical to build a system that uses udev only, and
> doesn't need systemd. Probably an indication that we should have a
> look at eudev? How would this interact with the systemd selection?
> What about incompatibilities between udev and eudev? 
What about using a different udev version with or without systemd? This
would allow using a recent systemd version while systems without it
could use the old udev or eudev, even as an option.

> Switching to ct-ng as the default toolchain backend has been in the
> plans for several years. But since it's not the default backend it
> isn't getting a lot of attention (example: for several months it was
> broken, libraries were not copied to the target, and it took a lot of
> time for somebody to notice). 
Regarding the toolchain I want to say that I really like buildroot's
ability to build a toolchain.

But I hate the fact that after every "make clean" the toolchain has to
be rebuilt completely from scratch which takes precious time.

Of course there is the possibility to change the output directory, build
the toolchain and then use it as an external toolchain, but this breaks
the nice integration between buildroot and it's toolchain and is not
really comfortable.

What about automating this process by splitting it up into building the
toolchain and afterwards copying it to output/{host/staging} like it is
done with external toolchains? "make clean" or maybe something new like
"make almostclean" would not clean the toolchain build directory, so
only the copy stage would be repeated. Another make target to clean
everything including the toolchain would be needed, of course.

> Handling of make xxx-menuconfig
>
>   * Conclusion: copy it back to the configured place, disallow
>     xxx-menuconfig unless something is configured. We always save full
>     config because defconfig is not always reliable.
>
As the one that brought up this topic I say that's a good compromise,
even though it means some inequality between handling buildroot's config
file and the others.

> Autobuilder status: Thomas will move the info to a database, and has
> some very basic webpages for accessing the database. He also dreams
> about running some tests in qemu - but we already have enough failures
> with the autobuilders as they are :-) 
I'd really like to have access to the results. For example it would be
interesting to see in which configuration a package fails and in which
not. I could think of cooking a script or program that extracts such
information on a package base.

Kind regards

Stephan
>
> In addition, I've done a quick summary of some of the most important
> topics discussed, and included a nice picture of the participants in a
> blog post on Emlinews:
>
>   http://www.emlinews.net/2013/02/buildroot-developers-meeting-report/
>
> While it has not been formally discussed during the meeting, it can be
> assumed that the next Buildroot Developers Meeting will take place next
> to the upcoming Embedded Linux Conference Europe (October 23-25 in
> Edimburgh, UK).
>
> Best regards,
>
> Thomas


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
