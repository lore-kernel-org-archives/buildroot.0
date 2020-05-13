From: Patrick Mochel <patrick.mochel@timesys.com>
Date: Wed, 13 May 2020 13:35:45 -0700
Subject: [Buildroot] Adding post image hook
In-Reply-To: <20200513221628.42c07184@windsurf.home>
References: <20200511175027.71ed1d22@windsurf.home>
 <ea-mime-5ebc52f4-7a9b-60b07d84@www-1.mailo.com>
 <20200513221628.42c07184@windsurf.home>
Message-ID: <CAFV4z9YFjJfSb9=-ydnvQkuSwdPpvk8KOUuY4iHQUKb7X5dvqg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
> Hi there,


On Wed, May 13, 2020 at 1:05 PM <lpdev@cordier.org> wrote:

>
>
> De : Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ? : lpdev at cordier.org
> Sujet : Re: [Buildroot] Adding post image hook
> Date : 11/05/2020 17:50:27 Europe/Paris
> Copie ? : buildroot at buildroot.org
>
> Hello,
>
> On Mon, 11 May 2020 16:35:10 +0200 (CEST)
> lpdev at cordier.org wrote:
>
> > I'm currently trying to improve my custom buildroot tree (that makes
> > use of BR2_EXTERNAL), especially the final steps. For instance my
> > external tree adds an extra steps through the
> > BR2_ROOTFS_POST_IMAGE_SCRIPT to generate the firmware file. This step
> > also retrieve the version of different softwares present in the final
> > image.
> >
> > However the post image script comes with a big limitation: we cannot
> > take the advantage of reading variables defined in the Makefile.
>
> You can actually do that, by running:
>
> make VARS=<some-variable-name> printvars
>
> from your post-image script.
>
> If what you need to retrieve is the version of the different packages,
> you can also run:
>
> make show-info
>
> from your post-image script, and parse the JSON output.
>
>
> Thank you for the tip. However this method seems to be very slow because
> of the makefile parsing (takes between 5 to 10sec on my PC). I would not
> recommend that for retrieving values of a lot of variables.
>

We are currently doing something analogous to what you initially described
and have run into the same behavior with 'make printvars' -- it takes a
long time to re-parse the Makefiles, no matter how many or few variables
you want.

You can use '%' to glob the names of variables; e.g.

$ make VARS='%_VERSION  # For every package's version

or

$ make VARS='EUDEV_%' # For every eudev variable

.. but you can only use it once, so you can't do this (purely theoretical)
example:

$ make VARS='%_CPE_%' # to get CPE_VENDOR, CVE_PRODUCT and CPE_VERSION for
every package

And, I've found that:

$ make VARS='%'

.. causes some amount of confusion internally and errors on the command
line.

In order to reduce the output generated -- and the amount of filtering
needed -- we are parsing the .config to get the packages that are enabled,
then generating the list of variable names to pass to 'make printvars'.
However, once that package list gets reasonably long, Bash gets upset at
the length of the command-line you're trying to execute. For now, we've
settled on a hybrid approach until we can revisit it and look into
rectifying it for good (and for everyone).

.. which is an excellent segue into stating that it's hard to say what an
ideal approach would be. It seems wasteful/unnecessary to export all make
variables to external helpers via the environment. And, it seems extraneous
to generate a new .hidden_file somewhere with a laundry-list of all make
variables, especially since they're changing over time (especially with
external components).

Getting back to the original poster -- I recommend looking into how
'support/scripts/pkg-stats' handles this WRT python's string methods
'.startswith()' and '.endswith()'. It ain't the prettiest nor most
efficient, but it works reasonably well and can be adapted to construct a
mapping of whatever it is you're looking for, for any component.

Cheers,


Patrick

>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200513/bc658c5a/attachment.html>
