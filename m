From: Christopher McCrory <chrismcc@gmail.com>
Date: Fri, 30 Aug 2019 11:37:47 -0700
Subject: [Buildroot] checksums was:[PATCH 1/2] package/tzdata: bump to
 version 2019b
In-Reply-To: <87ef13loef.fsf@dell.be.48ers.dk>
References: <20190828222851.11429-1-chrismcc@gmail.com>
 <87ef13loef.fsf@dell.be.48ers.dk>
Message-ID: <CALURroT2jGm+RUoyWr3fZ=M6re_2OE9Jy6zN_gannnRbKtWPZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 29, 2019 at 1:14 PM Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Christopher" == Christopher McCrory <chrismcc@gmail.com> writes:
>
>  > Changed _SITE to https.
>  > Add hash for license file.
>
>  > Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
>  > ---
>
> <snip>

>  > +# From
> https://mm.icann.org/pipermail/tz-announce/2019-July/000056.html
>  > +sha512
> c0104078d994e501d80a41bea31364b1390a75c2fbf42968a8343a090e2ac2eddbc58770ca470b192ea19dec89fcc634141a1de703ea2ffa0325176a64afe1fc
> tzdata2019b.tar.gz
>  > +# Locally computed:
>  > +sha512
> 0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf LICENSE
>
> This looks like a sha256sum rather than 512, and it indeed matches
> that.
>
>
D'oh, vim yank, paste error probably

My bash scripting is a little rusty, but how about something like this in
/utils/

cat gen-checksum.sh
#!/bin/sh

while getopts ":m125" option ; do
  case $option in
    m) MD5="true" ;;
    1) SHA1="true" ;;
    2) SHA256="true" ;;
    5) SHA512="true" ;;
    *) echo "-m for md5sum  -1 for sha1sum  -2 for sha256sum  -5 for
sha256"; exit ;;
  esac
done
shift $((OPTIND-1))

echo "# Locally calculated"
for FILE in $@ ; do
  if [ $MD5 ] ; then
    echo -n "md5 "
    basename -a `md5sum $FILE` | tr '\n' ' '
    echo
  fi
  if [ $SHA1 ] ; then
    echo -n "sha1 "
    basename -a `sha1sum $FILE` | tr '\n' ' '
    echo
  fi
  if [ $SHA256 ] ; then
    echo -n "sha256 "
    basename -a `sha256sum $FILE` | tr '\n' ' '
    echo
  fi
  if [ $SHA512 ] ; then
    echo -n "sha512 "
    basename -a `sha512sum $FILE` | tr '\n' ' '
    echo
  fi
done


[chrismcc at wednesday external]$ ./gen-checksum.sh -m125
~/src/rrdtool/rrdtool-1.7.2.tar.gz ../sdk/build/rrdtool-1.7.2/COPYRIGHT
../sdk/build/rrdtool-1.7.2/LICENSE
# Locally calculated
md5 638e3a0a1609d97e9f82e8832759dcd2 rrdtool-1.7.2.tar.gz
sha1 f0e54258b0f871099623e3a866751928abbb47af rrdtool-1.7.2.tar.gz
sha256 a199faeb7eff7cafc46fac253e682d833d08932f3db93a550a4a5af180ca58db
rrdtool-1.7.2.tar.gz
sha512
453230efc68aeb4a12842d20a9d246ba478a79c2f6bfd9693a91837c1c1136abe8af177be64fe29aa40bf84ccfce7f2f15296aefe095e89b8b62aef5a7623e29
rrdtool-1.7.2.tar.gz
md5 39df84cfd8a5e18bf988f277f7946676 COPYRIGHT
sha1 7a84d47375119e19a8b521c3df2e25019ca87321 COPYRIGHT
sha256 ab6b4646e9e01f1ec287c29c351c886c4cb7f945c11efc0a1be9f6e5e6cc5320
COPYRIGHT
sha512
18afc0a6f176fee2f28beea23a82e77d8b5a2665e9f97ac6773ab5941b39c021e17eca6fceabb5d0fc523e053cd21e8af614b0e3d1a4aa33c2d219101493afeb
COPYRIGHT
md5 4641e94ec96f98fabc56ff9cc48be14b LICENSE
sha1 db95910cb27890d60e596e4c622fc3eeba6693fa LICENSE
sha256 d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388
LICENSE
sha512
bd6aecc82d6894394ca4d871e96f68a36f8e84b56d764223d1667e358123cbfc30eb0b85922c406002dc1c400fa4dfb9a0afa9d43d3f3876a4ecdb8a8e85a1f7
LICENSE




-- 
Christopher McCrory
To the optimist, the glass is half full.
To the pessimist, the glass is half empty.
To the engineer, the glass is twice as big as it needs to be.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190830/5b0d6dc5/attachment.html>
