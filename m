From: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Wed, 20 Jun 2018 18:36:23 +0200
Subject: [Buildroot] [RFC 1/1] support: add qt5bump script
In-Reply-To: <20180619022835.32530-1-gael.portay@savoirfairelinux.com>
References: <20180619022835.32530-1-gael.portay@savoirfairelinux.com>
Message-ID: <56b3f748-6f38-fea7-9e83-14699817b73e@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 06/19/2018 04:28 AM, Ga?l PORTAY wrote:
> This script automatically bumps either the latest version of Qt or Qt
> 5.6 (if --5.6 option is given).
> 
> It updates URL and checksum of every module's hash file and downloads
> the sources to validate the changes (unless --no-download is specified
> through the command line).
> 
> The current patches are moved to the bumped version directory.

Last time I bumped a Qt version, I was surprised that Buildroot hasn't
such a script and I wrote one too but definitely not as good as yours ! :-)

I tried your script on the 2018.02.x branch to bump Qt to 5.9.6. It
ended with the following error:

make: *** empty string invalid as file name.  Stop.

Also, some hashes have a '.', for example:

-sha256 fef48529a6fc2617a30d75d952cb327c6be341fd104154993922184b3b3b4da1
qtbase-opensource-src-5.6.3.tar.xz
+sha256 fef485.9a6fc2617a30d75.952cb327c6be341fd10415.993922184b3b3b4da1
qtbase-opensource-src-5.6.3.tar.xz

I think that because of the 2nd script in the following sed expression:

> +# First, update references to Qt version in .hash files
> +find package/qt5/ -name "*.hash" -exec \
> +sed -e "s,$CURRENT_QT5_VERSION,$QT5_VERSION,g" \
> +    -e "s,$CURRENT_QT5_VERSION_MAJOR,$QT5_VERSION_MAJOR,g" \
> +    -i {} \;
> +

$CURRENT_QT5_VERSION and $CURRENT_QT5_VERSION_MAJOR contains '.' that
makes sed match hashes containing '5[a-f0-9]9' sequences. You have to
escape the '.' character. I fix this like this:

sed -e "s,${CURRENT_QT5_VERSION//./\\.},$QT5_VERSION,g" \
    -e "s,${CURRENT_QT5_VERSION_MAJOR//./\\.},$QT5_VERSION_MAJOR,g" \
    -i {} \;

Best regards,

-- 
S?bastien Szymanski
Software engineer, Armadeus Systems
Tel: +33 (0)9 72 29 41 44
Fax: +33 (0)9 72 28 79 26
