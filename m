From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 1 Jul 2017 22:55:53 +0200
Subject: [Buildroot] [RFC PATCH v5 02/11] package/patchelf: add patch
 for rpath sanitation under a root directory
In-Reply-To: <76510517-2a82-ab5d-1f5a-792831c18342@grandegger.com>
References: <1498811828-6893-1-git-send-email-wg@grandegger.com>
 <1498811828-6893-3-git-send-email-wg@grandegger.com>
 <e0092045-3a44-4b99-9220-5e8e05fef090@mind.be>
 <76510517-2a82-ab5d-1f5a-792831c18342@grandegger.com>
Message-ID: <cfa563e9-1546-c811-bbe2-0f91ece7a5c8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01-07-17 22:30, Wolfgang Grandegger wrote:
> 
> 
> Am 01.07.2017 um 00:13 schrieb Arnout Vandecappelle:
>>   Hi Wolfgang,
>>
>> On 30-06-17 10:36, Wolfgang Grandegger wrote:
>>> The patch allows to use patchelf to sanitize the rpath of the buildroot
>>> libraries and binaries using the option "--make-rpath-relative <rootdir>".
>>>
>>> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
>>
>>   I still have quite a few remarks, one of which is important: when the same
>> libfoo.so is present in two directories of the rpath, the second directory
>> should be removed but it isn't. See below for details.
> 
> Not sure if I understand you correctly. The rpath is for example
> "/usr/lib/dir1:/usr/lib/dir2" and libfoo.so is in both directories!?

 Yes. If that happens then dir2 should be removed from rpath (unless of course
there is still another needed lib in there).

 I admit it's unlikely that such a situation will arise in Buildroot, but let's
do the right thing :-)

[snip]
>>> ++static std::string makePathRelative(const std::string & path,
>>> ++    const std::string & refPath, const std::string & rootDir)
>>> ++{
>>> ++    std::string relPath = "$ORIGIN";
>>> ++
>>> ++    /* Strip root path first */
>>> ++    std::string p = path.substr(rootDir.length());
>>> ++    std::string refP = refPath.substr(rootDir.length());
>>> ++
>>> ++    std::size_t pos = refP.find_first_of('/');
>>> ++    while (pos != std::string::npos) {
>>> ++        pos =refP.find_first_of('/', pos + 1);
>>                   ^ missing space
>>
>>> ++        relPath.append("/..");
>>> ++    }
>>> ++    relPath.append(p);
>>
>>   I probably asked this before already, but why do we need to pass rootDir
>> instead of just eliminating the common part of path and refPath? Something like:
>>
>>      while (true) {
>>          pos = path.find_first_of('/');
>>          refPos = refPath.find_first_of('/');
>>          std::string chunk = path.substr(0, pos);
>>          std::string refChunk = refPath.substr(0, refPos);
>>          if (chunk != refChunk)
>>              break;
>>          path = path.substr(pos);
>>          refPath = refPath.substr(refPos);
>>      }
>> ...followed by the loop you already had.
> 
> Could be done. In that case the path ($ORIGIN) is not relative to rootdir. But
> that's not required. The path must just be within rootdir.

 Exactly.

 Well, actually, for HOST_DIR, it doesn't need to be in rootdir. For example,
it's possible that some host tool optionally links to libusb but our
host-package doesn't depend on libusb and doesn't pass --without-libusb. If you
have libusb installed on your build system in a non-standard path, it will be
discovered through pkg-config and the package will link with it, but then the
rpath is needed to make sure the executable still runs.

 So in fact, for host tools, we shouldn't eliminate RPATHs just because they are
outside of rootDir.

 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
