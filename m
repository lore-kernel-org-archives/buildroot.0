From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 17 May 2018 22:18:09 -0500
Subject: [Buildroot] [PATCH v4 5/5] support/scripts/pkgstats: add CPE
 reporting
In-Reply-To: <5afe436faeb5c_409b3f9b640c8a8410015a@ultri5.mail>
References: <bb3dfdb4-6479-41c0-1ca0-0bd68225a7b7@mind.be>
 <5afe436faeb5c_409b3f9b640c8a8410015a@ultri5.mail>
Message-ID: <CANQCQpbhxA3_gx_4aHRbqyuJ-GS3CKVezRqBLZpYa4snATVh2w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo,

On Thu, May 17, 2018 at 10:07 PM, Ricardo Martincoski
<ricardo.martincoski@gmail.com> wrote:
>
> Hello,
>
> On Wed, May 16, 2018 at 08:32 PM, Arnout Vandecappelle wrote:
> > On 16-05-18 05:43, Ricardo Martincoski wrote:
>
> [snip]
> >> @@ -569,4 +569,5 @@ class CPE:
> >>              cpe_file = gzip.GzipFile(fileobj=StringIO(compressed_cpe_file.read())).read()
> >> -            print("CPE: Converting xml manifest to dict...")
> >> -            self.all_cpes = xmltodict.parse(cpe_file)
> >> +            print("CPE: Converting xml manifest to list...")
> >> +            tree = ET.fromstring(cpe_file)
> >> +            self.all_cpes = [i.get('name') for i in tree.iter('{http://scap.nist.gov/schema/cpe-extension/2.3}cpe23-item')]
> >
> >  So after this you get basically the same as after comparison patch 1, right? So
> > the xmltodict takes 4 minutes? Or am I missing something?
>
> No. I missed something important and jumped to wrong conclusions.
>
> After adding some simple instrumentation code to display relative timestamps,
> the main difference in performance is *not* related to the xml parser used but
> it is related to the code used for find() and find_partial().
>
> I didn't performed further testings but it seems related to the use of
> startswith as you said.
>
> patch 1:
> 0:00:00.001015 CPE: Fetching xml manifest...
> 0:00:03.924777 CPE: Unzipping xml manifest...
> 0:00:11.672462 CPE: Converting xml manifest to list...
> 0:00:11.672504 before xmltodict.parse
> 0:00:36.343417 before append
> 0:00:36.462400 list created
> 0:00:36.738042 Build package list ...
> 0:00:36.875742 Getting package make info ...
> 0:00:58.543116 Getting package details ...
> 0:01:00.016925 BR Infra Not building CPE for pkg: [UBOOT]
> 0:01:07.714094 BR Infra Not building CPE for pkg: [IMX_USB_LOADER]
> ...
> 0:08:00.615649 BR Infra Not building CPE for pkg: [INTLTOOL]
> 0:08:01.243667 BR Infra Not building CPE for pkg: [DOXYGEN]
> 0:08:02.035463 Calculate stats
> 0:08:02.042401 Write HTML
>
> patch 2:
> 0:00:00.000889 CPE: Fetching xml manifest...
> 0:00:03.640856 CPE: Unzipping xml manifest...
> 0:00:14.569496 CPE: Converting xml manifest to list...
> 0:00:14.569541 before ET.fromstring
> 0:00:21.325842 before list comprehension
> 0:00:21.609946 list created
> 0:00:21.612443 Build package list ...
> 0:00:21.754223 Getting package make info ...
> 0:00:43.111196 Getting package details ...
> 0:00:43.828047 BR Infra Not building CPE for pkg: [UBOOT]
> 0:00:47.125995 BR Infra Not building CPE for pkg: [IMX_USB_LOADER]
> ...
> 0:03:46.279893 BR Infra Not building CPE for pkg: [INTLTOOL]
> 0:03:46.571266 BR Infra Not building CPE for pkg: [DOXYGEN]
> 0:03:46.892839 Calculate stats
> 0:03:46.895765 Write HTML
>
> >  Oh, actually, the [... for ... iter...] is also more efficient than
> > for...: append() so that could be an effect here as well. But this part of the
> > code is only O(#cpe packages) so it shouldn't have that much impact.
> >
> >>          except urllib2.HTTPError:package
> >> @@ -580,5 +581,5 @@ class CPE:
> >>          print("CPE: Searching for partial [%s]" % cpe_str)
> >> -        for cpe in self.all_cpes['cpe-list']['cpe-item']:
> >> -            if cpe_str in cpe['cpe-23:cpe23-item']['@name']:
> >> -                return cpe['cpe-23:cpe23-item']['@name']
> >> +        for cpe in self.all_cpes:
> >> +            if cpe.startswith(cpe_str):
> >
> >  Originally it was 'in' instead of startswith(). Obviously startswith() will be
> > more efficient. And also more correct, I guess, or does the partial match not

I just sent a revised v5 that's a hybrid of feedback so far.
http://patchwork.ozlabs.org/project/buildroot/list/?series=45124

Optimization wise, I did not switch to using .startswith however would
need to look now traversing a set with a for loop and using startswith
would be more efficient then doing a if "in" check.

Matt
