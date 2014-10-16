From: Ray Cordova <rayzinpwr@gmail.com>
Date: Wed, 15 Oct 2014 23:05:30 -0700
Subject: [Buildroot] perl 'custom module selection'
In-Reply-To: <CAB0FRssmh_aFzmVG2_Avs5oijjR9085HyQa2f+QOqSgLjW_3Tg@mail.gmail.com>
References: <CAKat-EZeif-fK5Zq9bB=00hGrVRu2bbOH9ax5xA7Lk7nRfh-Ag@mail.gmail.com>
 <CAB0FRssmh_aFzmVG2_Avs5oijjR9085HyQa2f+QOqSgLjW_3Tg@mail.gmail.com>
Message-ID: <CAKat-EZ3Cht6UQXMnQZ_69zgYoyUcdFDYxna3k9ctxDx5SsjCw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Okay, thanks for the help. This clears things up somewhat, but I'm still a
little confused. I suppose it would be easier to run a post install script
to clean things up?

I only need perl for Shorewall. Here's what the docs say is required:

    Perl Cwd Module

    Perl File::Basename Module

    Perl File::Temp Module

    Perl Getopt::Long Module

    Perl Carp Module

    Perl FindBin Module

    Perl Scalar::Util Module

    Perl Digest::SHA1 Module (Shorewall 4.5 only)

Ray

On Tue, Oct 14, 2014 at 11:52 AM, Fran?ois Perrad <francois.perrad@gadz.org>
wrote:

> t
>
> 2014-10-13 11:42 GMT+02:00 Ray Zin <rayzinpwr@gmail.com>:
> > Hello,
> >
> > I've selected perl and configured the 'custom module selection' like
> this:
> >
> > Cwd File/Basename File/Temp Getopt/Long Carp FindBin Scalar/Util
> >
> > But I don't get Cwd or Scalar/Util (everything else, ok).
> >
> > Under my build, normally these would be under i686-linux. So I also
> tried:
> >
> > i686-linux/Cwd File/Basename File/Temp Getopt/Long Carp FindBin
> > i686-linux/Scalar/Util
> >
> > Still no Cwd or Scalar/Util. Suggestions?
> >Cwd File/Basename File/Temp Getopt/Long Carp FindBin Scalar/Util
>
> The field 'custom module selection' allows to select some Perl core
> modules, when you don't want all core modules.
> If you set the field with:
>     Cwd File/Basename File/Temp Getopt/Long Carp FindBin Scalar/Util
> you could see theses lines during the Perl configure step:
>     Static modules:
>     Non-XS modules: cpan/File-Temp cpan/Getopt-Long dist/Carp
>     Dynamic modules: dist/Cwd
>
> The module FindBin and File/Basename are always included because there
> are in the 'lib' directory (and not in 'cpan' or 'dist').
>
> Finally, Scalar::Util is not a core module, but a part of
> Scalar-List-Utils.
> You could create the corresponding packages with the command:
>    $ support/script/scancpan Scalar-List-Utils
>
> And after select it in the ''Perl libraries/modules" list.
>
> Scalar-Util is a XS module, not a pure Perl module. So, you couldn't
> use the option BR2_PREFER_STATIC_LIB.
>
> If you don't have a strong footprint constraint, let empty the field
> 'custom module selection' and embeds all core modules.
>
> Fran?ois
>
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141015/20aa4ce2/attachment.html>
