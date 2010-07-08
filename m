From: Andy Gibbs <andyg1001@hotmail.co.uk>
Date: Thu, 8 Jul 2010 16:07:41 +0200
Subject: [Buildroot] Crosstool/Buildroot integration issue
References: <BLU0-SMTP11A24568AF672F1DE458A4E7B30@phx.gbl><201007071919.28956.yann.morin.1998@anciens.enib.fr>
	<20100708093456.61bf5501@surf>
Message-ID: <BLU0-SMTP95455AF352BBFC4EB5A7D8E7B40@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday, July 08, 2010 9:34 AM, Thomas Petazzoni wrote:

> At first look, I'm not a big fan of this solution, as it requires a lot
> of knowledge from the Buildroot user about dependency details that
> precisely Buildroot is supposed to handle.
>
> I'd prefer to understand why and when these gconv files are needed, and
> depending on that, see how it should fit in our configuration system.
>

I've had a google around for some more information, and it comes down to it 
being part of glibc (and by extension eglibc).  There is a whole page of 
information at 
http://www.gnu.org/s/libc/manual/html_node/glibc-iconv-Implementation.html. 
It is part of the character set conversion functions that are part of glibc. 
I understand from Yann's comments that uclibc doesn't include this folder 
(therefore either handles this another way, or doesn't at all!).

Further information is at 
http://www.gnu.org/s/libc/manual/html_node/Generic-Charset-Conversion.html.

Maybe if buildroot can determine that the external toolchain is glibc/eglibc 
based, it can simply then copy this folder over.  Below I've included a 
listing of the files contained in the folder (at least in my case). 
Basically they're all .so files, but there's also a 'gconv-modules' text 
file that holds the configuration data.

Maybe, for those who won't want / don't need it there could still be a 
buildroot configuration option controlling the copy, but the default 
position to do the copy?  Or maybe this should be something at the crosstool 
end?

Cheers
Andy


ANSI_X3.110.so       IBM037.so       IBM423.so           ISO_2033.so
ARMSCII-8.so         IBM038.so       IBM424.so           ISO_5427-EXT.so
ASMO_449.so          IBM1004.so      IBM437.so           ISO_5427.so
BIG5HKSCS.so         IBM1008_420.so  IBM4517.so          ISO_5428.so
BIG5.so              IBM1008.so      IBM4899.so          ISO646.so
BRF.so               IBM1025.so      IBM4909.so          ISO_6937-2.so
CP10007.so           IBM1026.so      IBM4971.so          ISO_6937.so
CP1125.so            IBM1046.so      IBM500.so           ISO8859-10.so
CP1250.so            IBM1047.so      IBM5347.so          ISO8859-11.so
CP1251.so            IBM1097.so      IBM803.so           ISO8859-13.so
CP1252.so            IBM1112.so      IBM850.so           ISO8859-14.so
CP1253.so            IBM1122.so      IBM851.so           ISO8859-15.so
CP1254.so            IBM1123.so      IBM852.so           ISO8859-16.so
CP1255.so            IBM1124.so      IBM855.so           ISO8859-1.so
CP1256.so            IBM1129.so      IBM856.so           ISO8859-2.so
CP1257.so            IBM1130.so      IBM857.so           ISO8859-3.so
CP1258.so            IBM1132.so      IBM860.so           ISO8859-4.so
CP737.so             IBM1133.so      IBM861.so           ISO8859-5.so
CP775.so             IBM1137.so      IBM862.so           ISO8859-6.so
CP932.so             IBM1140.so      IBM863.so           ISO8859-7.so
CSN_369103.so        IBM1141.so      IBM864.so           ISO8859-8.so
CWI.so               IBM1142.so      IBM865.so           ISO8859-9E.so
DEC-MCS.so           IBM1143.so      IBM866NAV.so        ISO8859-9.so
EBCDIC-AT-DE-A.so    IBM1144.so      IBM866.so           ISO-IR-197.so
EBCDIC-AT-DE.so      IBM1145.so      IBM868.so           ISO-IR-209.so
EBCDIC-CA-FR.so      IBM1146.so      IBM869.so           JOHAB.so
EBCDIC-DK-NO-A.so    IBM1147.so      IBM870.so           KOI8-R.so
EBCDIC-DK-NO.so      IBM1148.so      IBM871.so           KOI8-RU.so
EBCDIC-ES-A.so       IBM1149.so      IBM874.so           KOI-8.so
EBCDIC-ES.so         IBM1153.so      IBM875.so           KOI8-T.so
EBCDIC-ES-S.so       IBM1154.so      IBM880.so           KOI8-U.so
EBCDIC-FI-SE-A.so    IBM1155.so      IBM891.so           LATIN-GREEK-1.so
EBCDIC-FI-SE.so      IBM1156.so      IBM901.so           LATIN-GREEK.so
EBCDIC-FR.so         IBM1157.so      IBM902.so           libCNS.so
EBCDIC-IS-FRISS.so   IBM1158.so      IBM9030.so          libGB.so
EBCDIC-IT.so         IBM1160.so      IBM903.so           libISOIR165.so
EBCDIC-PT.so         IBM1161.so      IBM904.so           libJIS.so
EBCDIC-UK.so         IBM1162.so      IBM905.so           libJISX0213.so
EBCDIC-US.so         IBM1163.so      IBM9066.so          libKSC.so
ECMA-CYRILLIC.so     IBM1164.so      IBM918.so 
MAC-CENTRALEUROPE.so
EUC-CN.so            IBM1166.so      IBM921.so           MACINTOSH.so
EUC-JISX0213.so      IBM1167.so      IBM922.so           MAC-IS.so
EUC-JP-MS.so         IBM12712.so     IBM930.so           MAC-SAMI.so
EUC-JP.so            IBM1364.so      IBM932.so           MAC-UK.so
EUC-KR.so            IBM1371.so      IBM933.so           MIK.so
EUC-TW.so            IBM1388.so      IBM935.so           NATS-DANO.so
GB18030.so           IBM1390.so      IBM937.so           NATS-SEFI.so
GBBIG5.so            IBM1399.so      IBM939.so           PT154.so
GBGBK.so             IBM16804.so     IBM943.so           RK1048.so
GBK.so               IBM256.so       IBM9448.so          SAMI-WS2.so
gconv-modules        IBM273.so       IEC_P27-1.so        SHIFT_JISX0213.so
GEORGIAN-ACADEMY.so  IBM274.so       INIS-8.so           SJIS.so
GEORGIAN-PS.so       IBM275.so       INIS-CYRILLIC.so    T.61.so
GOST_19768-74.so     IBM277.so       INIS.so             TCVN5712-1.so
GREEK7-OLD.so        IBM278.so       ISIRI-3342.so       TIS-620.so
GREEK7.so            IBM280.so       ISO_10367-BOX.so    TSCII.so
GREEK-CCITT.so       IBM281.so       ISO_11548-1.so      UHC.so
HP-GREEK8.so         IBM284.so       ISO-2022-CN-EXT.so  UNICODE.so
HP-ROMAN8.so         IBM285.so       ISO-2022-CN.so      UTF-16.so
HP-ROMAN9.so         IBM290.so       ISO-2022-JP-3.so    UTF-32.so
HP-THAI8.so          IBM297.so       ISO-2022-JP.so      UTF-7.so
HP-TURKISH8.so       IBM420.so       ISO-2022-KR.so      VISCII.so
