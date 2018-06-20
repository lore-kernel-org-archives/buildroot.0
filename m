From: =?utf-8?B?R2HDq2w=?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Wed, 20 Jun 2018 13:58:49 -0400
Subject: [Buildroot] [RFC 1/1] support: add qt5bump script
In-Reply-To: <56b3f748-6f38-fea7-9e83-14699817b73e@armadeus.com>
References: <20180619022835.32530-1-gael.portay@savoirfairelinux.com>
 <56b3f748-6f38-fea7-9e83-14699817b73e@armadeus.com>
Message-ID: <20180620175848.ttom7pvqsqdj4x65@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi S?bastien,

On Wed, Jun 20, 2018 at 06:36:23PM +0200, S?bastien Szymanski wrote:
> Hi,
> 
> On 06/19/2018 04:28 AM, Ga?l PORTAY wrote:
> > (...)
> 
> Last time I bumped a Qt version, I was surprised that Buildroot hasn't
> such a script and I wrote one too but definitely not as good as yours ! :-)
>

Thanks ;)

> I tried your script on the 2018.02.x branch to bump Qt to 5.9.6. It
> ended with the following error:
> 
> make: *** empty string invalid as file name.  Stop.
>

Did you managed to understand why it ended with such error? I have never
met that issue.

> Also, some hashes have a '.', for example:
> 
> -sha256 fef48529a6fc2617a30d75d952cb327c6be341fd104154993922184b3b3b4da1
> qtbase-opensource-src-5.6.3.tar.xz
> +sha256 fef485.9a6fc2617a30d75.952cb327c6be341fd10415.993922184b3b3b4da1
> qtbase-opensource-src-5.6.3.tar.xz
> 
> I think that because of the 2nd script in the following sed expression:
> 
> > +# First, update references to Qt version in .hash files
> > +find package/qt5/ -name "*.hash" -exec \
> > +sed -e "s,$CURRENT_QT5_VERSION,$QT5_VERSION,g" \
> > +    -e "s,$CURRENT_QT5_VERSION_MAJOR,$QT5_VERSION_MAJOR,g" \
> > +    -i {} \;
> > +
> 
> $CURRENT_QT5_VERSION and $CURRENT_QT5_VERSION_MAJOR contains '.' that
> makes sed match hashes containing '5[a-f0-9]9' sequences. You have to
> escape the '.' character. I fix this like this:
> 
> sed -e "s,${CURRENT_QT5_VERSION//./\\.},$QT5_VERSION,g" \
>     -e "s,${CURRENT_QT5_VERSION_MAJOR//./\\.},$QT5_VERSION_MAJOR,g" \
>     -i {} \;
>

Good catch! I will fix that.

I met the same issue when I bumped to 5.11.0... and I forgot the fix it
becaused I did not met this issue when I tested my script with 5.11.1
bump or 5.6.2 downgrade :).

> Best regards,
> 
> -- 
> S?bastien Szymanski
> Software engineer, Armadeus Systems
> Tel: +33 (0)9 72 29 41 44
> Fax: +33 (0)9 72 28 79 26

Regards,
Ga?l
